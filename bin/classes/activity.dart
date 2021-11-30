import '../interfaces/activity.dart';

class Activity implements IActivity {
  final String? key;
  late dynamic args;

  Activity({
    this.key,
  });

  @override
  void start([dynamic arguments]) {
    args = arguments;
    initState();
  }

  @override
  void initState() {
    build();
  }

  @override
  void build() {}

  @override
  void dispose() {}
}
