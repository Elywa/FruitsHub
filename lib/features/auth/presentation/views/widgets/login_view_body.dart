import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/do_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(hint: 'البريد الالكتروني'),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(Icons.visibility_off_outlined),
              hint: 'كلمة المرور',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "نسيت كلمة المرور؟",
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(text: "تسجيل دخول", onPressed: () {}, isVisible: true),
            SizedBox(height: 33),
            DoNotHaveAccountWidget(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
            CustomLoginButton(
              iconImage: Assets.assetsImagesGoogleIcon,
              textButton: "تسجيل دخول بحساب جوجل",
              onPressed: () {},
            ),
            SizedBox(height: 16),
            CustomLoginButton(
              iconImage: Assets.assetsImagesAppleIcon,
              textButton: "تسجيل دخول بحساب أبل",
              onPressed: () {},
            ),
            SizedBox(height: 16),
            CustomLoginButton(
              iconImage: Assets.assetsImagesFacebookIcon,
              textButton: "تسجيل دخول بحساب فيسبوك",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
