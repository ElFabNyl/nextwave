import 'package:flutter/material.dart';
import 'package:nextwave/index.dart';
import 'package:nextwave/presentation/Screens/authentification/get_started.dart';
import 'package:nextwave/presentation/Screens/authentification/otp_verification.dart';
import 'package:nextwave/presentation/Screens/authentification/auth_index.dart';
import 'package:nextwave/presentation/Screens/authentification/sign_up.dart';
import 'package:nextwave/presentation/Screens/authentification/terms_policy.dart';
import 'package:nextwave/presentation/Screens/authentification/user_infos.dart';
import 'package:nextwave/presentation/Screens/send/address_infos.dart';
import 'package:nextwave/presentation/Screens/send/billing.dart';
import 'package:nextwave/presentation/Screens/send/confirmation.dart';
import 'package:nextwave/presentation/Screens/send/delivery_details.dart';
import 'package:nextwave/presentation/Screens/send/package_description.dart';
import 'package:nextwave/presentation/Screens/send/terms_and_cond.dart';
import 'package:nextwave/presentation/Screens/send/tracking.dart';

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
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthentificationIndexScreen());
      case  '/sign_up_user_infos':
        return MaterialPageRoute(builder: (_) => const SignUpUserInfos());
      case  '/opt':
        return MaterialPageRoute(builder: (_) => const OTPVerification());
      case '/terms_and_policy':
        return MaterialPageRoute(builder: (_) => const TermsAndPolicy());
      case '/get_started':
        return MaterialPageRoute(builder: (_)=> const GetStarted());
      case '/sign_up':
        return MaterialPageRoute(builder: (_)=> const SignUp());
      default:
        return null;
    }
  }
}
