import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.3,
        child: Column(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final isSelected = option == question.selectedOption;

    final color =
        option.text == 'true' ? AppColors.greenColor : AppColors.redColor;

    final borderColor = isSelected
        ? 'assets/icons/circle_fill.svg'
        : 'assets/icons/circle_check.svg';

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!question.isLocked) {
            onClickedOption(option);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Row(
            children: [
              SvgPicture.asset(borderColor),
              Text(
                option.text, // style: CategoriesTextStyle.category
              ),
            ],
          ),
        ),
      ),
    );
  }
}
