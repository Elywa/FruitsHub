import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_seller_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 17),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(
                  CircleAvatar(
                    backgroundColor: Color(0xffEEF8ED),
                    radius: 20,
                    child: SvgPicture.asset(
                      Assets.assetsImagesNotification,
                      fit: BoxFit.fill,
                    ),
                  ),
                  context: context,
                  title: 'الأكثر مبيعًا',
                ),
                SizedBox(height: 24),
                Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellerGridView(),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
