import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';
import 'package:fruits_hub/generated/l10n.dart';

class AcceptTermsWidget extends StatefulWidget {
  const AcceptTermsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isChecked,
          onChecked: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
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
