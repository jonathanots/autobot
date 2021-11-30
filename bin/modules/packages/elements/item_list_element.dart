import 'package:puppeteer/puppeteer.dart';

import '../../../classes/activity.dart';
import '../../../classes/logger.dart';

class PackageItemListElement extends Activity {
  final String tag = 'PackageItemListElement';

  final Page page;

  late String searchText;

  PackageItemListElement(this.page);

  @override
  void initState() async {
    print('$tag Started');
    searchText = args;

    super.initState();
  }

  @override
  void build() async {
    print('$tag Building');

    await page.evaluate("""() => document.querySelector('a[href="/packages/$searchText"]').click()""");

    await Future.delayed(Duration(seconds: 5));

    Logger('Sucess').start();

    print("Clicked");

    super.build();
  }
}
