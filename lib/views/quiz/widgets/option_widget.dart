import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../data/model/quiz_model.dart';


class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });

  final Question question;
  final ValueChanged<Option> onClickedOption;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Row(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final isSelected = option == question.selectedOption;

    // final color =
    //     option.text == 'true' ? AppColors.lightBlueColor : AppColors.redColor;

    final borderColor = isSelected ? Colors.white : Colors.transparent;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!question.isLocked) {
            onClickedOption(option);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          // Space between options
          padding: const EdgeInsets.all(16.0),
          // Padding inside the container
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.indigo,
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(1, 5),
              ),
            ],
          //  color: color,
         //   border: Border.all(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(40), // Rounded corners
          ),
          alignment: Alignment.center,
          child: Text(option.text,// style: CategoriesTextStyle.category
           ),
        ),
      ),
    );
  }
}
