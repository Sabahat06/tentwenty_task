import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';

class MyFilledButton extends StatelessWidget {
  @override
  String? txt="button";
  GestureTapCallback? ontap;
  Color ?color;
  Color? gradient1=AppColors.primaryColor;
  Color ?gradient2=AppColors.primaryColor;
  Color ?borderColor=AppColors.primaryColor;
  double? leftRightpadding;
  double ?borderRadius;
  double? width;
  double? txtFontSize;
  double? height;
  Color? txtColor;
  Color? splashColor;

  MyFilledButton({
    this.txt,
    this.ontap,
    this.leftRightpadding,
    this.borderRadius,
    this.width,
    this.color,
    this.height,
    this.txtColor,
    this.txtFontSize,
    this.splashColor
  });

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.only(left: leftRightpadding??0,  right:leftRightpadding?? 0),
        child: InkWell(
          splashColor: splashColor??Colors.white,
          borderRadius: BorderRadius.circular(borderRadius??80.0),
          onTap: ontap,
          child: Ink(
            height: height??40,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: color??borderColor!,),
              borderRadius: BorderRadius.circular(borderRadius??80.0),
              gradient: LinearGradient(colors: [
               color?? gradient1!,
                color?? gradient2!,
              ]),
            ),
            child: Center(
              child: Text(
                txt!,
                style: TextStyle(
                  color: txtColor?? Colors.white,
                  fontSize: txtFontSize??16.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
