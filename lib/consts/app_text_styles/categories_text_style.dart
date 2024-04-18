import 'package:flutter/material.dart';

import '../app_colors.dart';

class CategoriesTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static const TextStyle category = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );
  static const TextStyle question = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle result = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30.0,
    fontWeight: FontWeight.w400,
    color: AppColors.greenColor,
  );
  static const TextStyle score = TextStyle(
    fontFamily: 'Inter',
    fontSize: 25.0,
    fontWeight: FontWeight.w300,
    color: AppColors.greenColor,
  );
  static const TextStyle resultSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
}
