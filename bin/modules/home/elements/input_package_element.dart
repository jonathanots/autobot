import 'package:puppeteer/puppeteer.dart';

import '../../../classes/activity.dart';
import '../../../main.dart';

class HomeInputPackageElement extends Activity {
  final String tag = 'HomeInputPackageElement';

  final Page page;

  String searchText;

  HomeInputPackageElement(this.page, this.searchText);

  @override
  void initState() async {
    print('$tag Started');
    super.initState();
  }

  @override
  void build() async {
    print('$tag Building');

    await page.evaluate("() => document.getElementsByClassName('input')");
    await page.evaluate("() => document.getElementsByClassName('input')[0].value ='$searchText'");
    await page.evaluate("() => document.getElementsByClassName('input')[0].form.submit()");

    bool nextPage = false;

    await Future.delayed(Duration(seconds: 5), () async {
      var el = await page.evaluate("""() => document.querySelector('a[href="/packages/$searchText"]').innerText""") as String;

      nextPage = el.isNotEmpty && el == searchText;
    });

    if (nextPage) {
      print("Done");
      app.to.pushNamed('/packages');
    }
    super.build();
  }
}
