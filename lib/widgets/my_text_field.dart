import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/styles.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  bool? obsecureText =false;
  dynamic suffixIcon;
  dynamic prefixIcon;
  final ValueChanged<String>? onChanged;
  String? Function(String?)? validator;
  Function? onEditingComplete;
  GestureTapCallback? onTap;
  GestureTapCallback? onSuffixIconTap;
  bool? enabled=true;
  int? maxLines;
  String? hintText;
  TextInputType? keyboardType;
  bool? autoFocus;
  double? height;
  double? width;
  int? maxLength;
  FocusNode? focusNode;
  bool? phoneNumber=false;
  bool? disableborder=false;
  double?borderRadiusCircular;
  Color?fillColor;
  Color? borderColor;
  Color? labelTextColor;
  Color? textInputColor;
  Color? cursorColor;

  ///Constructor
  MyTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height,
    this.width,
    this.maxLength,
    this.focusNode,
    this.phoneNumber,
    this.disableborder,
    this.borderRadiusCircular,
    this.fillColor,
    this.borderColor,
    this.labelTextColor,
    this.validator,
    this.textInputColor,
    this.cursorColor,
    this.onSuffixIconTap
  });

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return Container(
      height: height??55.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
        color: AppColors.grey
      ),
      child: GestureDetector(
        onTap: onTap,
        child: TextFormField(
          validator: validator,
          focusNode: focusNode,
          maxLength: maxLength,
          autofocus: autoFocus??false,
          keyboardType: keyboardType,
          maxLines: maxLines??1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: (){ onEditingComplete!(); },
          expands: false,
          onChanged: onChanged,
          controller: controller,
          obscureText: obsecureText??false,
          cursorColor: cursorColor??AppColors.textColor,
          style: AppStyles.textFieldlabelTextStyle(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon == null
              ? const SizedBox(height: 2, width: 2,)
              : GestureDetector(
              onTap: onSuffixIconTap,
              child: Container(
                width: 19.w,
                height: 15.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(suffixIcon),
                  )
                ),
              ),
            ),
            prefixIcon: prefixIcon == null
              ? const SizedBox(height: 2, width: 2,)
              : Container(
              width: 19.w,
              height: 15.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(prefixIcon),
                )
              ),
            ),
            fillColor: fillColor??AppColors.grey,
            filled: true,
            focusColor: AppColors.primaryColor,
            hoverColor: AppColors.textColor,
            labelText: label,
            hintStyle: AppStyles.textFieldlabelTextStyle(),
            labelStyle: AppStyles.textFieldlabelTextStyle(),
            errorStyle: TextStyle(color: Colors.red, fontSize: 15.sp,),
            contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent,),
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent,),
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(100.w)),
            ),
          )
        ),
      ),
    );
  }
}
