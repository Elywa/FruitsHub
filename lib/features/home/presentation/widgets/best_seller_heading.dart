import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class BestSellerHeading extends StatelessWidget {
  const BestSellerHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Text(
            'الأكثر مبيعا',
            style: AppTextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
        Spacer(),
        GestureDetector(
          child: Text(
            'المزيد',
            style: AppTextStyles.regular13.copyWith(
              color: Color(0xFF0C0D0D).withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
