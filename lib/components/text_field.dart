import 'package:flutter/material.dart';

class InputFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final String? Function(String?)? checkInput;
  final TextEditingController ? controller;

  const InputFormFieldWidget({
    Key? key,
    this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.focusNode,
    this.checkInput,
     this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //validation
      // The validator receives the text that the user has entered.
      validator: checkInput,
      //
      obscureText: obscureText,
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      cursorColor: Colors.grey,
    );
  }
}
