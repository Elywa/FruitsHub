import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 25, height: 25, child: SvgPicture.asset(icon));
  }
}
