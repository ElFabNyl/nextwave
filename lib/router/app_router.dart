import 'package:flutter/material.dart';
import 'package:nextwave/index.dart';
import 'package:nextwave/presentation/Screens/authentification/auth_index.dart';
import 'package:nextwave/presentation/Screens/authentification/reset_password_email.dart';
import 'package:nextwave/presentation/Screens/authentification/sign_up.dart';
import 'package:nextwave/presentation/Screens/authentification/splash.dart';
import 'package:nextwave/presentation/Screens/send/address_infos/address_infos_screen.dart';
import 'package:nextwave/presentation/Screens/send/billing.dart';
import 'package:nextwave/presentation/Screens/send/confirmation.dart';
import 'package:nextwave/presentation/Screens/send/delivery_details.dart';
import 'package:nextwave/presentation/Screens/send/packages_description/package_description_screen.dart';
import 'package:nextwave/presentation/Screens/send/terms_and_cond.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/index':
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
        return MaterialPageRoute(builder: (_) => const Index());
      case '/sign_in':
        return MaterialPageRoute(
            builder: (_) => const AuthentificationIndexScreen());

      case '/sign_up':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/resetPassword1':
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen1());

      default:
        return null;
    }
  }
}
