import 'package:puppeteer/puppeteer.dart';

import '../types/types.dart';
import 'activity.dart';
import 'navigator.dart';

runApp(Function() fn) {
  fn();
}

class MainActivity extends Activity {
  static final MainActivity _instance = MainActivity._internal();

  // bool _lock = false;

  Activity? home;

  String? initialRoute;

  GenerateRoutes? onGenerateRoutes;

  Navigator? _to;

  Navigator get to => _to!;

  factory MainActivity({
    Activity? home,
    String initialRoute = '/',
    GenerateRoutes? onGenerateRoutes,
  }) {
    // assert(!_instance._lock, 'Singleton Already created');
    // assert(home == null, 'Please, pass some activity to start the app');

    _instance.home = home;
    _instance.initialRoute = initialRoute;
    _instance.onGenerateRoutes = onGenerateRoutes;
    _instance._to = Navigator(key: 'MainNavigator', onGenerateRoutes: onGenerateRoutes);

    return _instance;
  }

  MainActivity._internal();

  static Future<Browser> _launchPuppeter() async {
    // Download the Chromium binaries, launch it and connect to the "DevTools"
    return await puppeteer.launch(headless: false);
  }

  static Future<Browser> get browser async => await _launchPuppeter();

  // MainActivity({
  //   required this.home,
  //   required this.initialRoute,
  //   required GenerateRoutes? onGenerateRoutes,
  // }) {
  //   _to = Navigator(key: 'MainNavigator', onGenerateRoutes: onGenerateRoutes);
  // }

  @override
  void initState() async {
    print('Main Activiy Started');
    super.initState();
  }

  @override
  void build() {
    print('Main Activiy Building');
    if (_to != null) _to!.pushNamed(initialRoute ?? '/');
    // super.build();
  }
}
