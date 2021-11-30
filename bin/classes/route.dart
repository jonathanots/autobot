import 'activity.dart';

class Route<T extends Activity> {
  String path;
  T module;

  Route({
    required this.path,
    required this.module,
  });
}
