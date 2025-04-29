import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

class AcceptTermsWidget extends StatelessWidget {
  const AcceptTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(isChecked: true),
        SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            textAlign: TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.bold13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.bold13.copyWith(
                    color: Color(0xFF2D9F5D),
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.bold13.copyWith(
                    color: Color(0xFF2D9F5D),
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.bold13.copyWith(
                    color: Color(0xFF2D9F5D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
