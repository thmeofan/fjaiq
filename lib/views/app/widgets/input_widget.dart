import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final String? svgAsset;
  final double? svgSize;

  const InputWidget({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.svgAsset,
    this.svgSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: TextField(
          style: ConstructorTextStyle.inputText,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            labelText: label,
            labelStyle: ConstructorTextStyle.lable,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            prefixIcon: svgAsset != null
                ? Padding(
                    padding: EdgeInsets.all(svgSize ?? 16.0),
                    child: SvgPicture.asset(
                      svgAsset!,
                      width: svgSize,
                      height: svgSize,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
