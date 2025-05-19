import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/widgets/shop_now_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.21,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        image: DecorationImage(
          image: AssetImage(Assets.assetsImagesFruitsTest),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              width: MediaQuery.sizeOf(context).width * 0.46,
              child: SvgPicture.asset(
                Assets.assetsImagesCircelFeaturedItem,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'عروض العيد',
                  style: AppTextStyles.regular13.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  'خصم 25%',
                  style: AppTextStyles.bold19.copyWith(color: Colors.white),
                ),
                SizedBox(height: 15),
                ShopNowButton(
                  onPressed: () {
                    debugPrint("Shop Now Button Pressed");
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
