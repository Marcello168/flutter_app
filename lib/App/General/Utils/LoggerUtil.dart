import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
      ),
);

class LoggerUtil {
  // 工厂模式
  factory LoggerUtil() => _getInstance();
  static LoggerUtil get instance => _getInstance();
  static LoggerUtil _instance;
  LoggerUtil._internal() {
    // 初始化
  }
  static LoggerUtil _getInstance() {
    if (_instance == null) {
      _instance = new LoggerUtil._internal();
    }
    return _instance;
  }

  /// Log a message at level [Level.verbose].
  static void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    logger.wtf(message, error, stackTrace);
  }
}
