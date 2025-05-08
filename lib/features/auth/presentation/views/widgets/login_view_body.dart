import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/password_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin%20cubit/signin_cubit_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/do_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                validator: (mail) {
                  if (mail == null || mail.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }

                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );

                  if (!emailRegex.hasMatch(mail)) {
                    return 'يرجى إدخال بريد إلكتروني صالح';
                  }

                  return null;
                },
                hint: 'البريد الالكتروني',
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              // CustomTextFormField(
              //   onSaved: (value) {},
              //   suffixIcon: Icon(Icons.visibility_off_outlined),
              //   hint: 'كلمة المرور',
              //   keyboardType: TextInputType.number,
              // ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: AppTextStyles.bold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(
                text: "تسجيل دخول",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubitCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                isVisible: true,
              ),
              SizedBox(height: 33),
              DoNotHaveAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              CustomLoginButton(
                iconImage: Assets.assetsImagesGoogleIcon,
                textButton: "تسجيل دخول بحساب جوجل",
                onPressed: () {
                  context.read<SigninCubitCubit>().signInWithGoogle();
                },
              ),
              SizedBox(height: 16),
              CustomLoginButton(
                iconImage: Assets.assetsImagesAppleIcon,
                textButton: "تسجيل دخول بحساب أبل",
                onPressed: () {},
              ),
              SizedBox(height: 16),
              CustomLoginButton(
                iconImage: Assets.assetsImagesFacebookIcon,
                textButton: "تسجيل دخول بحساب فيسبوك",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
