import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
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
              PasswordTextForField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              AcceptTermsWidget(),
              SizedBox(height: 30),
              CustomButton(
                text: " إنشــاء حســاب جـديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().signup(
                      email: email,
                      password: password,
                      name: name,
                    );
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

class PasswordTextForField extends StatefulWidget {
  const PasswordTextForField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextForField> createState() => _PasswordTextForFieldState();
}

class _PasswordTextForFieldState extends State<PasswordTextForField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.number,
      hint: 'كلمة المرور',
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },

        child:
            obscureText
                ? Icon(Icons.visibility_off_outlined)
                : Icon(Icons.visibility_outlined),
      ),
    );
  }
}
