/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 16:47:52
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-19 19:18:21
 * @Description: file content
 */

import 'package:oktoast/oktoast.dart';
import '../CustomWidget/Dialog/LoadingDialog.dart';
import '../CustomWidget/Dialog/DialogParam.dart';

class ToastHelper {
  /// 不主动隐藏
  static const _maxTime = 10000;
  static ToastFuture _future;

  /// 显示LoadingView
  static showLoadingToast() {
    _future = showToastWidget(
        LoadingDialog(
          showParam: ShowParam(),
        ),
        duration: Duration(seconds: _maxTime),
        onDismiss: () => _future = null);
  }

  /// 显示有标题的LoadingView
  static showLoadingTextToast() {
    _future = showToastWidget(
        LoadingDialog(
          showParam: ShowParam(),
        ),
        duration: Duration(seconds: _maxTime));
  }

  /// 显示标题
  static showTextToast(String text) {
    showToast(text);
  }

  /// 显示带有成功Toast
  ///  暂未实现
  static showSucessToast() {
    // showToast(text);
  }

  /// 显示带有成功标题的Toast
  ///  暂未实现
  static showSucessTextToast(String text) {
    // showToast(text);
  }

  /// 显示带有失败标题的Toast
  ///  暂未实现
  static showFailToast() {
    // showToast(text);
  }

  /// 显示带有失败标题的Toast
  ///  暂未实现
  static showFailTextToast(String text) {
    // showToast(text);
  }

  /// 隐藏Loading
  static hidden() {
    if (_future != null) {
      _future.dismiss();
      _future = null;
    }
  }
}
