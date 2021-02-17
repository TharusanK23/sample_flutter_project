// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:eStore/routes/index.dart';

class AppRouter {
  static const welcomeScreen = WelComeView.routeName;
  static const splashScreen = SplashScreen.routeName;
  static const registerScreen = RegisterView.routeName;
  static const loginScreen = LoginView.routeName;
  static const otpScreen = OtpView.routeName;
  static const introScreen = IntroView.routeName;
  static const mainScreen = MainView.routeName;
  static const homeScreen = HomeView.routeName;
  static const productsScreen = ProductListView.routeName;
  static const profileScreen = ProfileView.routeName;
  static const productFullViewScreen = ProductFullView.routeName;

  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.welcomeScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => WelComeView(),
          settings: settings,
        );
      case AppRouter.splashScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case AppRouter.loginScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case AppRouter.registerScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => RegisterView(),
          settings: settings,
        );
      case AppRouter.otpScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => OtpView(),
          settings: settings,
        );
      case AppRouter.introScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => IntroView(),
          settings: settings,
        );
      case AppRouter.mainScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => MainView(),
          settings: settings,
        );
      case AppRouter.homeScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => HomeView(),
          settings: settings,
        );
      case AppRouter.productsScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => ProductListView(),
          settings: settings,
        );
      case AppRouter.profileScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => ProfileView(),
          settings: settings,
        );
      case AppRouter.productFullViewScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => ProductFullView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
