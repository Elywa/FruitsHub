import 'package:flutter/material.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/on_boarding_view.dart';

import '../../features/splash view/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    default:
      return MaterialPageRoute(
        builder:
            (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
