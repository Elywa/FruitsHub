import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: const HomeViewBody()));
  }
}
