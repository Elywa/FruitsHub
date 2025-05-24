import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffEEF8ED),
      radius: 20,
      child: SvgPicture.asset(
        Assets.assetsImagesNotification,
        fit: BoxFit.fill,
      ),
    );
  }
}