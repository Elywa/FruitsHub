import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/accept_terms_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(hint: 'الاسم كامل'),
            SizedBox(height: 16),
            CustomTextFormField(hint: 'البريد الإلكتروني'),
            SizedBox(height: 16),
            CustomTextFormField(
              hint: 'كلمة المرور',
              suffixIcon: Icon(Icons.visibility_off_outlined),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            AcceptTermsWidget(),
            SizedBox(height: 30),
            CustomButton(
              text: " إنشــاء حســاب جـديد",
              onPressed: () {},
              isVisible: true,
            ),
            SizedBox(height: 16),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
