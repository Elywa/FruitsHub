import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/data/repos%20impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin%20cubit/signin_cubit_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubitCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل الدخول"),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}


