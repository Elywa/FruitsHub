import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'ابحث عن.......',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: SvgPicture.asset(
            Assets.assetsImagesFilterIcon,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.assetsImagesSearchNormal,
            colorFilter: ColorFilter.mode(
              AppColors.lightPrimaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
