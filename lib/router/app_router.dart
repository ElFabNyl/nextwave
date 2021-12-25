import 'package:flutter/material.dart';
import 'package:nextwave/index.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Index());

      default:
        return null;
    }
  }
}
