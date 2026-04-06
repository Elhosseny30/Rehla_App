import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({super.key, this.selectedNumber, required this.currentPage});
  final int? selectedNumber;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          5,
          (index) => AnimatedContainer(
            duration: Duration(microseconds: 900),
            margin: EdgeInsets.only(right: 10),
            width: (index == currentPage) ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedNumber == 1
                    ? MyColors.blueColor
                    : selectedNumber == 2
                    ? MyColors.greenColor
                    : MyColors.mainColor,
              ),
              color: (index <= currentPage
                  ? selectedNumber == 1
                  ? MyColors.blueColor
                  : selectedNumber == 2
                  ? MyColors.greenColor
                  : MyColors.mainColor
                  : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
