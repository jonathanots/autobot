import 'package:puppeteer/puppeteer.dart';

import '../../classes/activity.dart';
import '../../classes/main_activity.dart';
import 'elements/item_list_element.dart';

class PackageActivity extends Activity {
  final String tag = 'PackageActivity';

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

    final pages = await browser.pages;

    final page = pages[1];

    PackageItemListElement(page).start(args);
    super.build();
  }
}
