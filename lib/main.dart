import 'package:flutter/material.dart';
import 'package:fruits_hub/features/splash%20view/presentation/views/splash_view.dart';
import 'package:fruits_hub/utils/functions/routing.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
