import 'package:flutter/material.dart';
import 'package:nextwave/presentation/Screens/send/home.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());

      default:
        return null;
    }
  }
}
