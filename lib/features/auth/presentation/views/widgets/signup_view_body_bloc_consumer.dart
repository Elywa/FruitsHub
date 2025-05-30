import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/custom_snackBar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup%20cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          buildErrorsSnackBar(context, state.errorMessage);
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,

          child: SignupViewBody(),
        );
      },
    );
  }
}
