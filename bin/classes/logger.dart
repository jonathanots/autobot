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
    if (format == Format.standart) {
    } else if (format == Format.dense) {
    } else if (format == Format.deep) {
    } else {}

    super.build();
  }
}
