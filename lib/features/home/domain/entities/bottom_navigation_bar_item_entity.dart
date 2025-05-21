import 'package:fruits_hub/core/utils/assets.dart';

class BottomNavigationBarItemEntity {
  final String title;
  final String activeIcon;
  final String inActiveIcon;

  BottomNavigationBarItemEntity({
    required this.title,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

List<BottomNavigationBarItemEntity> get bottomNavigationBarItems => [
  BottomNavigationBarItemEntity(
    title: 'الرئيسية',
    activeIcon: Assets.assetsImagesHomeActive,
    inActiveIcon: Assets.assetsImagesHome,
  ),
  BottomNavigationBarItemEntity(
    title: 'المنتجات',
    activeIcon: Assets.assetsImagesProductsActive,
    inActiveIcon: Assets.assetsImagesProductsInActive,
  ),
  BottomNavigationBarItemEntity(
    title: 'سلة التسوق',
    activeIcon: Assets.assetsImagesShoppingCartActive,
    inActiveIcon: Assets.assetsImagesShoppingCartInActive,
  ),
  BottomNavigationBarItemEntity(
    title: 'حسابي',
    activeIcon: Assets.assetsImagesUserActive,
    inActiveIcon: Assets.assetsImagesUser,
  ),
];
