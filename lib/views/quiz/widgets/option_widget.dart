import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/categories_text_style.dart';
import '../../../data/model/quiz_model.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });

  final Question question;
  final ValueChanged<Option> onClickedOption;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  final _stateKey = GlobalKey<_OptionWidgetState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.35,
        child: Column(
          children: widget.question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final isSelected = option == widget.question.selectedOption;
    final isCorrect =
        widget.question.isLocked && isSelected && option.isCorrect;
    final isIncorrect =
        widget.question.isLocked && isSelected && !option.isCorrect;

    final color = isCorrect
        ? AppColors.greenColor
        : isIncorrect
            ? AppColors.redColor
            : option.text == 'true'
                ? AppColors.greenColor
                : AppColors.whiteColor;

    final borderIcon = isSelected
        ? 'assets/icons/circle_fill.svg'
        : 'assets/icons/circle_check.svg';

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!widget.question.isLocked) {
            widget.onClickedOption(option);
            Future.delayed(Duration(milliseconds: 500), () {
              _stateKey.currentState?.setState(() {});
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Row(
            children: [
              SvgPicture.asset(
                borderIcon,
                color: color,
              ),
              SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  option.text,
                  style: CategoriesTextStyle.category.copyWith(color: color),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
