abstract class INavigatorError implements Exception {
  final String message;

  INavigatorError([this.message = "Basic Navigator Error"]);
}

class RouteNotFound extends INavigatorError {
  RouteNotFound([String message = "The requested route not founded"]) : super(message);
}

class RootCantBeRemoved extends INavigatorError {
  RootCantBeRemoved([String message = "You are trying remove the root route. This can't be able because you gonna crash your app"]) : super(message);
}

class EmptyRouteTree extends INavigatorError {
  EmptyRouteTree([String message = "You are trying remove a route when the route tree is empty"]) : super(message);
}
