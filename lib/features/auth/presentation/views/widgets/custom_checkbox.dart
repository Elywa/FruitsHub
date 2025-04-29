import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.isChecked});
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 25,
      height: 25,
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: isChecked ? Colors.white : Colors.grey),
        color: isChecked ? AppColors.primaryColor : Colors.white,
      ),
      child:
          isChecked
              ? Center(child: SvgPicture.asset(Assets.assetsImagesCheck))
              : SizedBox(),
    );
  }
}
