import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_search_field.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 8),
                HomeAppBar(),
                SizedBox(height: 16),
                HomeSearchField(),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.88,
                  height: MediaQuery.sizeOf(context).height * 0.20,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                        Assets.assetsImagesGrapesGreen488x,
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      // side: BorderSide(
                      //   color: AppColors.lightPrimaryColor,
                      //   width: 1,
                      // ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width:
                          MediaQuery.sizeOf(context).width *
                          0.45, // half of parent's height
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor2,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "عروض العيد",
                            style: AppTextStyles.regular13.copyWith(
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            "خصم 25%",
                            style: AppTextStyles.bold19.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 45,
                            width: 120,
                            child: Center(child: Text("تسوق الآن")),
                          ),
                        ],
                      ),
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
