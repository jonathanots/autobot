import '../interfaces/activity.dart';

class Activity implements IActivity {
  final String? key;

  Activity({
    this.key,
  }) {
    initState();
  }

  @override
  void initState() {
    build();
  }

  @override
  void build() {
    // TODO: implement build
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
