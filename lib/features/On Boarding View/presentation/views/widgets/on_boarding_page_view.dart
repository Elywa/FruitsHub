import 'package:flutter/material.dart';
import 'package:fruits_hub/features/On%20Boarding%20View/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.currentPage,
  });
  final PageController pageController;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        PageViewItem(
          isVisible: true,

          backgroundImage: Assets.assetsImagesPageViewItemBackgroundImage1,
          image: Assets.assetsImagesPageViewItemImage1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مرحبًا بك في"),
              const Text("HUB"),
              const Text("Fruit"),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
        ),
        PageViewItem(
          isVisible:  false,

          image: Assets.assetsImagesPageViewItemImage2,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundImage: Assets.assetsImagesPageViewItemBackgroundImage2,
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
        ),
      ],
    );
  }
}
