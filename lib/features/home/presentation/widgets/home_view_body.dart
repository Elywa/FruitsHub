import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_seller_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/widgets/best_seller_heading.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_item_list_view.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_search_field.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 8),
                HomeAppBar(),
                SizedBox(height: 16),
                HomeSearchField(),
                SizedBox(height: 12),
                FeaturedItemsListView(),
                SizedBox(height: 12),
                BestSellerHeading(),
                SizedBox(height: 12),
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
