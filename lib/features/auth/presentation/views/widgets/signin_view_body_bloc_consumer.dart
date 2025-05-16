import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/custom_snackBar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin%20cubit/signin_cubit_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruits_hub/features/home/presentation/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubitCubit, SigninCubitState>(
      listener: (context, state) {
        if (state is SigninCubitFailure) {
          buildErrorsSnackBar(context, state.errorMessage);
        } else if (state is SigninCubitSuccess) {
          // Handle success state if needed
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninCubitLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
