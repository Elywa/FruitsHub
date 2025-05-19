import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .3,
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(4),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'تسوق الان',
            style: AppTextStyles.bold13.copyWith(color: Color(0xFF1B5E37)),
          ),
        ),
      ),
    );
  }
}
