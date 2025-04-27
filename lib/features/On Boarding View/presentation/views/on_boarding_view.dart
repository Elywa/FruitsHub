import 'package:flutter/material.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'on_boarding_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}
