import 'package:flutter/material.dart';

import 'package:hraccoon/view/home_page.dart';

class RouteName {
  static const login = '/login';
  static const home = '/home';
}

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
