import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionSVGWidget extends StatelessWidget {
  final String imagePath;

  const IntroductionSVGWidget({
    key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
