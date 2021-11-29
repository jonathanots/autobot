import 'package:puppeteer/puppeteer.dart';

import '../types/types.dart';
import 'activity.dart';
import 'navigator.dart';

runApp(MainActivity main) {
  main.build();
}

class MainActivity {
  static MainActivity? _instance;
  static MainActivity get instance => _instance!;

  Activity? home;

  String initialRoute;

  GenerateRoutes? onGenerateRoutes;

  Navigator _to = Navigator();

  Navigator get to => _to;

  Future<Browser>? _browser;

  Future<Browser> get browser async => await _browser!;

  factory MainActivity({
    Activity? home,
    String initialRoute = '/',
    GenerateRoutes? onGenerateRoutes,
  }) {
    return _instance ??= MainActivity._internal(home, initialRoute, onGenerateRoutes);
  }

  MainActivity._internal(this.home, this.initialRoute, this.onGenerateRoutes) {
    _instance = this;
    _instance!._to = Navigator(key: 'MainNavigator', onGenerateRoutes: onGenerateRoutes);
    _instance!._browser = _launchPuppeter();
  }

  Future<Browser> _launchPuppeter() async {
    // Download the Chromium binaries, launch it and connect to the "DevTools"
    return await puppeteer.launch(headless: false);
  }

  // static Future<Browser> get browser async => await _launchPuppeter();

  void build() {
    print('Main Activiy Building');
    // if (_to != null) _to!.pushNamed(initialRoute ?? '/');
    MainActivity.instance.to.pushNamed(initialRoute);
  }
}
