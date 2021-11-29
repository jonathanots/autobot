import 'classes/main_activity.dart';
import 'classes/navigator.dart';
import 'classes/route.dart';
import 'modules/home/home_activity.dart';
import 'modules/packages/package_activity.dart';

void main() async {
  runApp(MainActivity(
    home: HomeActivity(),
    initialRoute: Navigator.initialRoute,
    onGenerateRoutes: () {
      return {
        '/': Route(path: '/', module: HomeActivity()),
        '/packages': Route(path: '/packages', module: PackageActivity()),
      };
    },
  ));
}
