import 'package:puppeteer/puppeteer.dart';

import '../types/types.dart';
import 'navigator.dart';

runApp(MainActivity main) {
  main.build();
}

class MainActivity {
  static MainActivity? _instance;
  static MainActivity get instance => _instance!;

  String initialRoute;

  Navigator _to = Navigator();

  Navigator get to => _to;

  Future<Browser>? _browser;

  Future<Browser> get browser async => await _browser!;

  factory MainActivity({
    String initialRoute = '/',
    GenerateRoutes? onGenerateRoutes,
  }) {
    return _instance ??= MainActivity._internal(initialRoute, Navigator(key: 'MainNavigator', onGenerateRoutes: onGenerateRoutes), _launchPuppeter());
  }

  MainActivity._internal(this.initialRoute, this._to, this._browser) {
    _instance = this;
  }

  static Future<Browser> _launchPuppeter() async {
    // Download the Chromium binaries, launch it and connect to the "DevTools"
    return await puppeteer.launch(headless: false);
  }

  void build() {
    print('Main Activity Building');
    MainActivity.instance.to.pushNamed(initialRoute);
  }
}
