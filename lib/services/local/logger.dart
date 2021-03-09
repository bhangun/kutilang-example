import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class AppLogger {
  static final MemoryAppender logMessages = MemoryAppender();
  // Singleton instance
  static final AppLogger _singleton = AppLogger._();
  static final _logger = Logger('main');
  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppStorage class itself.
  AppLogger._();

  // Singleton accessor
  static AppLogger get instance {
    Logger.root.level = Level.ALL;
    PrintAppender().attachToLogger(Logger.root);
    logMessages.attachToLogger(Logger.root);
    _logger.fine('Application launched. (v2)');
    _setTargetPlatformForDesktop();

    return _singleton;
  }

  // Database object accessor
  static get i async {
    return  Logger('main');
  }

  /// If the current platform is desktop, override the default platform to
  /// a supported platform (iOS for macOS, Android for Linux and Windows).
  /// Otherwise, do nothing.
  static void _setTargetPlatformForDesktop() {
    // no longer required.
  }
}

class StringBufferWrapper with ChangeNotifier {
  final StringBuffer _buffer = StringBuffer();

  void writeln(String line) {
    _buffer.writeln(line);
    notifyListeners();
  }

  @override
  String toString() => _buffer.toString();
}

class ShortFormatter extends LogRecordFormatter {
  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write(
        '${rec.time.hour}:${rec.time.minute}:${rec.time.second} ${rec.level.name} '
        '${rec.message}');

    if (rec.error != null) {
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.write(stackTrace);
    }
    return sb;
  }
}

class MemoryAppender extends BaseLogAppender {
  MemoryAppender() : super(ShortFormatter());

  final StringBufferWrapper log = StringBufferWrapper();

  @override
  void handle(LogRecord record) {
    log.writeln(formatter.format(record));
  }
}
