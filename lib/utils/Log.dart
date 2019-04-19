/// 日志显示类
class Log {
  /// 是否打开日志
  static bool isOpenLog = true;

  /// 是否打开debug级别的日志
  static bool isOpenDebug = true;

  /// 是否打开info级别的日志
  static bool isOpenInfo = true;

  /// 是否打开warn级别的日志
  static bool isOpenWarn = true;

  /// 是否打开error级别的日志
  static bool isOpenError = true;

  /// debug级别的日志
  static void d(String msg) {
    if (isOpenLog == false || isOpenDebug == false) {
      return;
    }
    _printLog(msg);
  }

  /// info级别的日志
  static void i(String msg) {
    if (isOpenLog == false || isOpenInfo == false) {
      return;
    }
    _printLog(msg);
  }

  /// warn级别的日志
  static void w(String msg) {
    if (isOpenLog == false || isOpenWarn == false) {
      return;
    }
    _printLog(msg);
  }

  /// error级别的日志
  static void e(String msg) {
    if (isOpenLog == false || isOpenError == false) {
      return;
    }
    _printLog(msg);
  }

  // 打印日志
  static void _printLog(String msg) {
    int segmentSize = 256;
    int temp = msg.length ~/ segmentSize;
    int other = msg.length % segmentSize;
    for (int i = 0; i < temp; i++) {
      print(msg.substring(i * segmentSize, segmentSize * (i + 1)));
    }
    if (other > 0) {
      print(msg.substring(temp * segmentSize, temp * segmentSize + other));
    }
  }
}
