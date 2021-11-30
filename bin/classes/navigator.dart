import '../errors/navigator_errors.dart';
import '../types/types.dart';
import 'activity.dart';
import 'route.dart';

class Navigator extends Activity {
  Map<String, Route> generatedRoutes = const {};

  List<Route> routes = [];

  Route? _currentRoute;

  Navigator({
    String? key,
    GenerateRoutes? onGenerateRoutes,
  }) : super(key: key) {
    if (onGenerateRoutes != null) {
      generatedRoutes = onGenerateRoutes();
    }
  }

  static String get initialRoute => '/';

  Route get currentRoute => _currentRoute!;

  setCurrentRoute(Route r) => _currentRoute = r;

  Route findRoute(String path) {
    for (var r in generatedRoutes.keys.toList()) {
      if (r == path) {
        return generatedRoutes[r]!;
      }
    }

    throw RouteNotFound();
  }

  Future<dynamic> pushNamed(String to, {dynamic args}) async {
    Route run = findRoute(to);

    setCurrentRoute(run);
    routes.add(run);
    //Update start to dynamic
    return run.module.start(args);
  }

  Future<dynamic> pushReplacementNamed(String to, {dynamic args}) async {
    Route run = findRoute(to);

    removeRoute(currentRoute);
    setCurrentRoute(run);
    routes.add(run);
    return run.module.start(args);
  }

  void removeRoute(Route r) {
    r.module.dispose();
    routes.removeWhere((element) => element.path == r.path);
  }

  void pop() {
    if (routes.isEmpty) {
      throw EmptyRouteTree();
    } else if (routes.length == 1) {
      throw RootCantBeRemoved();
    }

    routes.last.module.dispose();
    routes.removeLast();
  }
}
