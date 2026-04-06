import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
    required this.validator,
    required this.tappedEnableBorder,
    required this.selectedNumber,
    this.onChanged,
    this.nationalID =false,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool tappedEnableBorder;
  final int? selectedNumber;
  final void Function(String)? onChanged;
  bool  nationalID = false;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obSecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.nationalID == true ?TextInputType.number: TextInputType.text ,
      inputFormatters: widget.nationalID
          ? [
              FilteringTextInputFormatter.digitsOnly, 
              LengthLimitingTextInputFormatter(14),     
            ]
          : [],
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
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
          borderSide: BorderSide(
            width: 1,
            color: widget.selectedNumber == 1
                ? MyColors.blueColor : widget.selectedNumber == 2 ? MyColors.greenColor
                : MyColors.mainColor,
          ),
        ),
      ),
    );
  }
}
