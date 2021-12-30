import 'package:flutter/material.dart';
import 'package:nextwave/index.dart';
import 'package:nextwave/presentation/Screens/send/address_infos.dart';
import 'package:nextwave/presentation/Screens/send/billing.dart';
import 'package:nextwave/presentation/Screens/send/confirmation.dart';
import 'package:nextwave/presentation/Screens/send/delivery_details.dart';
import 'package:nextwave/presentation/Screens/send/package_description.dart';
import 'package:nextwave/presentation/Screens/send/terms_and_cond.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Index());
      case '/package_description':
        return MaterialPageRoute(builder: (_) => const PackageDescription());
      case '/address_infos':
        return MaterialPageRoute(builder: (_) => const Address());
      case '/delivery_details':
        return MaterialPageRoute(builder: (_) => const DeliveryDetails());
      case '/terms_and_conditions2':
        return MaterialPageRoute(builder: (_) => const TermsAndConditions2());
     case '/billing':
        return MaterialPageRoute(builder: (_) => const BillingScreen());
      case '/confirmation':
        return MaterialPageRoute(builder: (_) => const Confirmation());
      case '/tracking':
        return MaterialPageRoute(builder: (_) => const Confirmation());
      default:
        return null;
    }
  }
}
