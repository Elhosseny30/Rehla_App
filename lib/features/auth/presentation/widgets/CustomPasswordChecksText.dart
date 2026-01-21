import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomPasswordCheckText extends StatelessWidget {
  const CustomPasswordCheckText({super.key, required this.isValid, required this.text});
  final bool isValid;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(isValid?Icons.check_circle : Icons.radio_button_unchecked,
        color:isValid?MyColors.greenColor:const Color.fromARGB(87, 107, 105, 105),
        size: 25,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Text(
            maxLines: 2,
            
            text,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          
              
          ),),
        )
      ],
    );
  }
}
