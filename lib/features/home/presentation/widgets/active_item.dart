import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_item_entity.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.item});
  final BottomNavigationBarItemEntity item;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.actviveItemBackgroundColor,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: AppColors.primaryColor,
              child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(item.activeIcon),
              ),
            ),
            SizedBox(width: 6),
            FittedBox(
              child: Text(
                item.title,
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}