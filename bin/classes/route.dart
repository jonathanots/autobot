import '../interfaces/activity.dart';

class Route<T extends IActivity> {
  String path;
  T module;

  Route({
    required this.path,
    required this.module,
  });
}
