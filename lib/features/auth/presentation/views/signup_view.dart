import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context ,title:  "تسجيل حساب جديد"),
      body: SignupViewBody());
  }
}
