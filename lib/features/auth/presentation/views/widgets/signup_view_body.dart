import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/functions/custom_snackBar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/password_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup%20cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/accept_terms_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },

                hint: 'الاسم كامل',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hint: 'البريد الإلكتروني',
              ),
              SizedBox(height: 16),
              PasswordTextFormField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              AcceptTermsWidget(
                onChanged: (value) {
                  isChecked = value;
                  setState(() {});
                },
              ),
              SizedBox(height: 30),
              CustomButton(
                text: " إنشــاء حســاب جـديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isChecked == true) {
                      context.read<SignupCubit>().signup(
                        email: email,
                        password: password,
                        name: name,
                      );
                    } else {
                      buildErrorsSnackBar(
                        context,
                        "يجب عليك قبول الشروط والأحكام",
                      );
                    }
                    // Call your signup function here with email, password, and name
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                isVisible: true,
              ),
              SizedBox(height: 16),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
