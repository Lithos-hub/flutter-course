import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.icon,
    this.inputType,
    required this.formProperty,
    required this.formValues,
  });

  final String? hintText;
  final String? labelText;
  final String? helperText;

  final IconData? suffixIcon;
  final IconData? icon;

  final String? inputType;

  final String formProperty;
  final Map<String, dynamic> formValues;

  static Map<String, TextInputType> inputTypeOptions = {
    'email': TextInputType.emailAddress,
    'text': TextInputType.text,
    'number': TextInputType.number,
    'phone': TextInputType.phone,
    'datetime': TextInputType.datetime,
  };

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // initialValue: 'Initial value',
        textCapitalization: TextCapitalization.words,
        keyboardType: inputTypeOptions[inputType],
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) {
          if (value == null) return 'Field required';
          return value.length < 2 ? '2 characters minimum' : null;
        },
        obscureText: inputType == 'password',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ));
  }
}
