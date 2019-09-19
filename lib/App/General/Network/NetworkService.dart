import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './NetConfig.dart';
import './ResponseData.dart';
import './NetworkTips.dart';

enum Method {
  GET,
  POST,
  UPLOAD,
  DOWNLOAD,
}

class NetworkService {
  static const String _TAG = "NetworkService";
  static Dio dio;

  /// get请求
  get(String url,
      {Map<String, dynamic> params,
      bool showLoad,
      String loadMsg = NetworkTips.DEFAULT_LOADING_MESSAGE}) async {
    return await request(url,
        method: Method.GET,
        params: params,
        showLoad: showLoad,
        loadMsg: loadMsg);
  }

  /// post请求
  post(String url,
      {Map<String, dynamic> params,
      bool showLoad,
      String loadMsg = NetworkTips.DEFAULT_LOADING_MESSAGE}) async {
    return await request(url,
        method: Method.POST,
        params: params,
        showLoad: showLoad,
        loadMsg: loadMsg);
  }

  /// 附件上传
  upLoad(var file, String fileName, String url,
      {Map<String, dynamic> params,
      bool showLoad,
      String loadMsg = NetworkTips.UPLOAD_LOADING_MESSAGE}) async {
    return await request(url,
        method: Method.UPLOAD,
        params: params,
        file: file,
        fileName: fileName,
        loadMsg: loadMsg,
        showLoad: showLoad);
  }

  /// 附件下载
  download(String url, String savePath,
      {bool showLoad,
      String loadMsg = NetworkTips.UPLOAD_LOADING_MESSAGE}) async {
    return await request(url,
        method: Method.DOWNLOAD,
        fileSavePath: savePath,
        showLoad: showLoad,
        loadMsg: loadMsg);
  }

  ///  请求部分
  request(String url,
      {Method method,
      Map<String, dynamic> params,
      var file,
      String fileName,
      String fileSavePath,
      bool showLoad = true,
      String loadMsg = NetworkTips.DEFAULT_LOADING_MESSAGE}) async {
    try {
      Response response;

      Dio dio = createInstance();
      var headers = await getHeaders();
      if (headers != null) {
        dio.options.headers = headers;
      }
      var baseUrl = await getBasicUrl();
      dio.options.baseUrl = baseUrl;
      // 打印网络日志
      StringBuffer requestParam = new StringBuffer();
      requestParam.write("$_TAG ");
      requestParam.write("Url:");
      requestParam.write(baseUrl);
      requestParam.write(url);
      requestParam.write("\n");
      requestParam.write("$_TAG ");
      requestParam.write("params:");
      requestParam.write(json.encode(params));
      printLog(requestParam.toString());

      switch (method) {
        case Method.GET:
          response = await dio.get(url, queryParameters: params);
          break;
        case Method.POST:
          response = await dio.post(url, data: params);
          break;
        case Method.UPLOAD:
          {
            FormData formData = new FormData();
            if (params != null) {
              formData = FormData.fromMap(params);
            }

            /// 第一个fileName是参数名, 必须和接口一致, 第二个fileName是文件的文件名
            formData.files.add(MapEntry(
                fileName, MultipartFile.fromBytes(file, filename: fileName)));
            response = await dio.post(url, data: formData);
            break;
          }
        case Method.DOWNLOAD:
          response = await dio.download(url, fileSavePath);
          break;
      }
      return await handleDataSource(response, method, url: url);
    } catch (exception) {
      printLog("$_TAG net exception= " + exception.toString());
      return ResponseData(NetworkTips.NETE_ERROR_MESSAGE, false, url: url);
    }
  }

  /// 数据处理
  static handleDataSource(Response response, Method method, {String url = ""}) {
    ResponseData resultData;
    String errorMsg = "";
    int statusCode;
    statusCode = response.statusCode;
    printLog("$_TAG statusCode:" + statusCode.toString());
    if (method == Method.DOWNLOAD) {
      if (statusCode == 200) {
        /// 下载成功
        resultData = ResponseData(NetworkTips.DOWNLOAD_SUCESS, true);
      } else {
        /// 下载失败
        resultData = ResponseData(NetworkTips.DOWNLOAD_FAIL, false);
      }
    } else {
      Map<String, dynamic> data;
      if (response.data is Map) {
        data = response.data;
      } else {
        data = json.decode(response.data);
      }
      if (isPrint()) {
        printBigLog("$_TAG data: ", json.encode(data));
      }

      //处理错误部分
      if (statusCode != 200) {
        errorMsg =
            NetworkTips.NETE_REQUEST_ERROR + " 状态码:" + statusCode.toString();
        resultData = ResponseData(errorMsg, false, url: url);
      } else {
        try {
          resultData = ResponseData.response(data);
        } catch (exception) {
          resultData = ResponseData(exception.toString(), true, url: url);
        }
      }
    }
    return resultData;
  }

  getHeaders() {
    return null;
  }

  getBasicUrl() {
    return null;
  }

  static void printLog(String log, {tag}) {
    bool print = isPrint();
    if (print) {
      String tagLog;
      if (tag != null) {
        tagLog = tag + log;
      } else {
        tagLog = log;
      }
      debugPrint(tagLog);
    }
  }

  static void printBigLog(String tag, String log) {
    //log = TEST_POEM;
    bool print = isPrint();
    const MAX_COUNT = 800;
    if (print) {
      if (log != null && log.length > MAX_COUNT) {
        // 超过1000就分次打印
        int len = log.length;
        int paragraphCount = ((len / MAX_COUNT) + 1).toInt();
        for (int i = 0; i < paragraphCount; i++) {
          int printCount = MAX_COUNT;
          if (i == paragraphCount - 1) {
            printCount = len - (MAX_COUNT * (paragraphCount - 1));
          }
          String finalTag = "" + tag + "\n";
          printLog(
              log.substring(i * MAX_COUNT, i * MAX_COUNT + printCount) + "\n",
              tag: finalTag);
        }
      } else {
        String tagLog;
        if (tag == null) {
          tagLog = tag + log;
        } else {
          tagLog = log;
        }
        printLog(tagLog);
      }
    }
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions option = new BaseOptions(
          baseUrl: NetConfig.BASE_URL,
          connectTimeout: NetConfig.CONNECT_TIMEOUT,
          receiveTimeout: NetConfig.RECEIVE_TIMEOUT,
          headers: {"user-agent": "dio", "api": "1.0.0"},
          contentType: 'json',
          // contentType: ContentType.JSON,
          // Transform the response data to a String encoded with UTF8.
          // The default value is [ResponseType.JSON].
          responseType: ResponseType.plain);
      dio = new Dio(option);
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  static bool isPrint() {
    return NetConfig.DEBUG;
  }
}
