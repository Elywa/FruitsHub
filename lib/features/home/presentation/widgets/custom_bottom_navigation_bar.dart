import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_item_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            bottomNavigationBarItems.asMap().entries.map((e) {
              var index = e.key;
              var item = e.value;
              return Expanded(
                flex: index == selectedIndex ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: BottomNavigationBarItem(
                    isActive: selectedIndex == index,
                    item: item,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

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

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem({
    super.key,
    required this.isActive,
    required this.item,
  });
  final bool isActive;
  final BottomNavigationBarItemEntity item;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(item: item)
        : InActiveItem(icon: item.inActiveIcon);
  }
}
