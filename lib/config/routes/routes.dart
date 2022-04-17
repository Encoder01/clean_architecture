import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String register = "/register";
  static String settings = "/settings";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler =
        Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(settings,
        handler: settingsHandler, transitionType: TransitionType.native);
  }
}
