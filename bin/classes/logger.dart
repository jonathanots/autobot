import 'dart:developer' as dev;
import 'dart:io';

import '../interfaces/log.dart';
import 'activity.dart';

///Register a message into log file
///Template message
///
///Format Standart
///[Title/Level/DateTime - Message]
///
///Format Dense
///[DateTime - Message]
///
///Format Deep
///[Title/Level - Message - DateTime - Code]
class Logger extends Activity {
  final String title;
  final String? message;
  final Level level;
  final Format format;
  final int code;
  final bool debugMode;

  Logger(
    this.message, {
    this.title = 'FrameworkLoggger',
    this.level = Level.info,
    this.format = Format.standart,
    this.code = -1,
    this.debugMode = true,
  });

  @override
  void build() {
    String? log;
    if (format == Format.standart) {
      log = "$title/$level/${DateTime.now().toIso8601String()} - $message";
    } else if (format == Format.dense) {
      log = "${DateTime.now().toIso8601String()} - $message";
    } else if (format == Format.deep) {
      log = "$title/$level  - $message - ${DateTime.now().toIso8601String()} - $code";
    } else {}

    if (log != null) {
      if (debugMode) dev.log(log);

      File file = File('static/logs/log.log');

      file.writeAsString('\n' + log, mode: FileMode.append);
    }

    super.build();
  }
}
