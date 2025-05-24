import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best%20selling%20view/presentation/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'bestSellingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BestSellingViewBody());
  }
}
