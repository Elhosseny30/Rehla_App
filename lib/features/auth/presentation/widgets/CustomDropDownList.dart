import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomDropDownList extends StatelessWidget {
   const CustomDropDownList({
    super.key,
    required this.stagesList,
    required this.validator,
    required this.color,
    required this.text,
    required this.selectedValue, 
    required this.onChanged,
  });
  final String text;
  final Color color;
  final List<String> stagesList;
  final String? Function(String ?)? validator;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField2<String>(
      isExpanded: true, // عشان ياخد العرض كامل
      // التصميم الداخلي للزرار
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.babyGreyColor,
        contentPadding:  EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          // البوردر البمبي
          borderRadius: BorderRadius.circular(15),
          borderSide:  BorderSide(color:color , width: 1.5),
        ),
        // ... باقي الستايل بتاعك
      ),

      hint:  Text(text, style: TextStyle(fontSize: 18)),

      items: stagesList
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style:  TextStyle(fontSize: 18)),
            ),
          )
          .toList(),

      onChanged: onChanged,
      value: selectedValue,
      validator: validator,
      // --- هنا السحر (ضبط مكان وشكل القائمة) ---
      dropdownStyleData: DropdownStyleData(
        // 1. تدوير حواف القائمة المنزلقة نفسها
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        // 2. إزاحة القائمة (Offset)
        // الرقم الثاني (-4) بيتحكم في الارتفاع، جربي أرقام زي -5 أو 0 أو 10 لحد ما تظبط تحت الزرار بالظبط
        offset: const Offset(0, -5),

        // أقصى ارتفاع للقائمة (عشان لو العناصر كتير ماتاخدش الشاشة كلها)
        maxHeight: 200,
      ),

      menuItemStyleData:  MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),

      // أيقونة السهم
      iconStyleData:  IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
      ),
    );
  }
}
