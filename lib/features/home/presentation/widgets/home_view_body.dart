import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_item.dart';
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
                FeaturedItemsListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedItemsListView extends StatelessWidget {
  const FeaturedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.21,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FeaturedItem(),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
