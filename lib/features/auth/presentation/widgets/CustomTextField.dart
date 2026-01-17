import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    required this.validator,
    required this.tappedEnableBorder, required this.selectedNumber,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool tappedEnableBorder;
  final int? selectedNumber;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obSecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? obSecureText : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obSecureText = !obSecureText;
                  });
                },
                icon: Icon(
                  obSecureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        filled: true,
        fillColor: MyColors.babyGreyColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: fontsApp.mainFont,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1, 
          color: widget.selectedNumber == 1 ? MyColors.blueColor: MyColors.mainColor),
        ),
      ),
    );
  }
}
