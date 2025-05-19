import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: const Text('أحمد مصطفي', style: AppTextStyles.bold16),
      trailing: CircleAvatar(
        backgroundColor: Color(0xffEEF8ED),
        radius: 25,
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
          fit: BoxFit.fill,
        ),
      ),
      leading: CircleAvatar(
        radius: 25,
        child: SvgPicture.asset(
          Assets.assetsImagesCircleAvatar,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
