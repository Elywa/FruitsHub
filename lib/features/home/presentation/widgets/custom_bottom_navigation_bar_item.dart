import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/widgets/inActive_item.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
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