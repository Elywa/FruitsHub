import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'تمتلك حساب بالفعل؟',
              style: AppTextStyles.bold16.copyWith(color: Color(0xFF949D9E)),
            ),
            TextSpan(text: '  '),
            TextSpan(
              text: 'تسجيل دخول',
              style: AppTextStyles.bold16.copyWith(color: Color(0xFF2D9F5D)),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
