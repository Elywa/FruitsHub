import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/services/fire_base_service.dart';
import 'package:fruits_hub/core/services/prefs.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/on_boarding_view.dart';

import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/features/home/presentation/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    executeDelayedNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(Assets.assetsImagesPlanetSplash)],
          ),
          SvgPicture.asset(Assets.assetsImagesLogo),
          SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
        ],
      ),
    );
  }

  void executeDelayedNavigation() {
    Future.delayed(const Duration(seconds: 4), () {
      var isOnBoradingView = Prefs.getBool(kIsOnBoradingView);
      if (isOnBoradingView) {
        var isLoggedIn = FireBaseService().isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
