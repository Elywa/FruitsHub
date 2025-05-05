import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
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