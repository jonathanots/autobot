import '../../classes/activity.dart';
import 'package:puppeteer/puppeteer.dart';

import '../../classes/main_activity.dart';
import 'elements/input_package_element.dart';

class HomeActivity extends Activity {
  final String tag = 'HomeActivity';

  late Browser browser;

  final app = MainActivity();

  @override
  void initState() async {
    browser = await app.browser;

    print('$tag Started');
    super.initState();
  }

  @override
  void build() async {
    print('$tag Building');

    var page = await browser.newPage();
    await page.goto('https://pub.dev/', wait: Until.networkIdle);

    HomeInputPackageElement(page, 'uuid').start();
    super.build();
  }
}
