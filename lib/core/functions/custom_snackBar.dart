import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup%20cubit/signup_cubit.dart';

void buildErrorsSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(errorMessage)));
}
