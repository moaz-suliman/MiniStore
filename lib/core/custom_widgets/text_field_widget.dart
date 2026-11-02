import 'package:flutter/material.dart';
import 'package:small_shop/core/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  const TextFieldWidget({
    super.key,
    required this.icon,
    required this.hintText,
    this.labelText = '',
    this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText.isEmpty ? null : labelText,
          prefixIcon: icon,
          hintStyle: TextStyle(color: AppColor.textFieldHintText),
          fillColor: AppColor.cardColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}