// ignore_for_file: prefer_const_constructors
import 'package:project_template/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:project_template/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:project_template/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/onboarding/widgets/language_picker.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = "/";
  static const String languageSelection = "/languageSelection";
  static const String onboarding = "/onboarding";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String forgotPassword = "/forgotPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });

      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) {
          return OnboardingScreen();
        });

      case Routes.languageSelection:
        return MaterialPageRoute(builder: (context) {
          return LanguagePickerFragement();
        });

      case Routes.signIn:
        return MaterialPageRoute(builder: (context) {
          return SignInScreen();
        });
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) {
          return SignUpScreen();
        });

      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (context) {
          return ForgotPasswordScreen();
        });

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(child: Text('No Route Found')),
            ));
  }
}
