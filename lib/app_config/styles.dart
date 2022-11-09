import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';

class AppStyles{

  static TextStyle commonTextStyle(Color color) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color
    );
  }

  static TextStyle titleTextStyle() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white
    );
  }

  static TextStyle genresTextStyle() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white
    );
  }

  static TextStyle descriptionTextStyle() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.descriptionTextColor
    );
  }

  static TextStyle textFieldlabelTextStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textFieldTextColor
    );
  }

}