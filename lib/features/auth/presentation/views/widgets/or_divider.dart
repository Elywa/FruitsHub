import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.withOpacity(.5))),
        SizedBox(width: 18),
        Text(
          "أو",
          style: AppTextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
        ),
        SizedBox(width: 18),
        Expanded(child: Divider(color: Colors.grey.withOpacity(.5))),
      ],
    );
  }
}
