import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟',
            style: AppTextStyles.bold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(text: '  '),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: AppTextStyles.bold16.copyWith(
              color: const Color(0xFF1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
