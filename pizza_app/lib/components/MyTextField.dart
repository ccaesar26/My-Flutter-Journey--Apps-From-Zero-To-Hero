import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final String? errorMsg;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.errorMsg,
    this.focusNode,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorMsg,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    );
  }
}