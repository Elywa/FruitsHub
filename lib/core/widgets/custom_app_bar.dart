import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  Widget? trainlingWidget, {
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
    leading: Padding(
      padding: const EdgeInsets.only(left: 14),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    ),

    actions: [trainlingWidget ?? const SizedBox.shrink()],
  );
}
