import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/prefs.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
      print(currentPage);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ),
        const SizedBox(height: 29),
        CustomDotsIndicator(currentPage: currentPage),
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: "ابدأ الان",
            onPressed: () {
              Prefs.setBool(kIsOnBoradingView, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
            isVisible: currentPage == 1 ? true : false,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
