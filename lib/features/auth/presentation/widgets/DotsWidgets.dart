import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({super.key, this.selectedNumber});
  final int? selectedNumber;
  @override
  Widget build(BuildContext context) {
    final int currentPage =0;
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
              border: Border.all(color: selectedNumber == 1
                        ? MyColors.blueColor
                        : MyColors.mainColor),
              color: (index <= currentPage
                  ? selectedNumber == 1
                        ? MyColors.blueColor
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
