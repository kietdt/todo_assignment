import 'package:flutter/material.dart';
import 'package:flutter_application_1/resource/route_name.dart';
import 'package:flutter_application_1/view/dash_board/dash_board.dart';
import 'package:get/route_manager.dart';

//created by kietdt
class RouteManager {
  static RouteManager? _internal;
  RouteManager._();

  BaseRouteName routeName = BaseRouteName();
  Map<String, Widget Function(dynamic)>? routes;

  late String initialRoute;

  factory RouteManager() {
    if (_internal == null) _internal = RouteManager._();
    return _internal!;
  }

  void init() {
    initialRoute = routeName.dashBoard;
    routes = _initRoute();
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    return GetPageRoute(
        curve: Curves.linear,
        page: () => routes![routeSettings.name]!(routeSettings.arguments));
  }

  Map<String, Widget Function(dynamic)> _initRoute() {
    return {routeName.dashBoard: (arg) => DashBoard()};
  }
}
