import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ),

          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(Assets.assetsImagesWatermillomTest),
                SizedBox(height: 24),

                ListTile(
                  title: Text('بطيخ', style: AppTextStyles.semiBold13),
                  subtitle: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '20جنية ',
                            style: AppTextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: AppTextStyles.bold13.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' الكيلو',
                            style: AppTextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
