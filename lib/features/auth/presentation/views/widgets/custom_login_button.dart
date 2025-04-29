import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
    required this.iconImage,
    required this.textButton,
    required this.onPressed,
  });
  final String iconImage;
  final String textButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56),
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(iconImage),
          Spacer(),
          Text(
            textButton,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16.copyWith(
              color: Color(0xFF0C0D0D).withOpacity(.8),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
