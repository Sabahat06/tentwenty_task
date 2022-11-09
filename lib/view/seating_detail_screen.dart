import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:tentwenty_task/view_model/seating_view_model.dart';
import 'package:tentwenty_task/widgets/my_filled_button.dart';

class SeatingDetailScreen extends StatelessWidget {
  MovieDetailViewModel movieDetailViewModel;

  SeatingDetailScreen(this.movieDetailViewModel);

  @override
  Widget build(BuildContext context) {
    final seatingViewModel = Provider.of<SeatingViewModel>(context,);
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.backgroundColor,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppUtils.pop(context: context);
                          },
                          child: Container(
                            height: 15.h,
                            width: 7.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppConstants.backIconBlack),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Text(movieDetailViewModel.movieDetailModel.title!, style: AppStyles.commonTextStyle(AppColors.black),),
                            Text("In Theaters ${movieDetailViewModel.movieDetailModel.releaseDate!}", style: AppStyles.commonTextStyle(AppColors.primaryColor),),
                          ],
                        ),
                        SizedBox(width: 5.w,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                ],
              ),
            ),
            SizedBox(height: 100.h,),
            for(int i = 1; i<= 10; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(width: 20.sp, height: 20.sp, child: Text(i.toString(), style: TextStyle(fontSize: 10.sp, color: AppColors.black),)),
                        Spacer(),
                        i == 1 || i==2 || i==3 || i==4 ? seatWidget("Empty") : seatWidget(""),
                        i == 1 ? seatWidget("Empty") : seatWidget(""),
                        i == 1 ? seatWidget("Empty") :  seatWidget(""),
                        seatWidget(""),
                        seatWidget("Regular"),
                        Spacer(),
                        seatWidget(""),
                        seatWidget(""),
                        seatWidget(""),
                        seatWidget("VIP"),
                        seatWidget(""),
                        seatWidget(""),
                        seatWidget("Regular"),
                        seatWidget(""),
                        seatWidget("Selected"),
                        seatWidget(""),
                        Spacer(),
                        seatWidget("Selected"),
                        seatWidget("Selected"),
                        i == 1 ? seatWidget("Empty") : seatWidget(""),
                        i == 1 ? seatWidget("Empty") :  seatWidget(""),
                        i == 1 || i==2 || i==3 || i==4 ? seatWidget("Empty") : seatWidget(""),
                      ],
                    ),
                  ],
                ),
              ),
            Spacer(),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        renderingSeatTypes(AppColors.yellow, "Selecteed"),
                        renderingSeatTypes(Color(0xffA6A6A6), "Not Available"),
                      ],
                    ),
                    SizedBox(height: 18.h,),
                    Row(
                      children: [
                        renderingSeatTypes(AppColors.purple, "VIP (150\$)"),
                        renderingSeatTypes(AppColors.primaryColor, "Regular (50\$)"),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffA6A6A6).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('4 / 3 row', style: AppStyles.textFieldlabelTextStyle(),),
                            Icon(Icons.clear, color: AppColors.black, size: 18.sp,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyFilledButton(
                          width: 108.w,
                          height: 50.h,
                          color: Color(0xffA6A6A6).withOpacity(0.2),
                          borderRadius: 10.sp,
                          txt: "Total Price \$ 50",
                          txtColor: AppColors.black,
                          txtFontSize: 12.sp,
                        ),
                        SizedBox(width: 10.h,),
                        MyFilledButton(
                          width: 216.w,
                          height: 50.h,
                          color: AppColors.primaryColor,
                          borderRadius: 10.sp,
                          txt: "Proceed to pay",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderingSeatTypes(Color color, String title) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: Container(
        width: 150.w,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 13.h,
                  width: 17.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.sp),
                    color: color
                  ),
                ),
                SizedBox(height: 1.h,),
                Container(
                  height: 2.5.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    color: color
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Text(title, style: AppStyles.descriptionTextStyle(),)
          ],
        ),
      ),
    );
  }

  Widget seatWidget(String type) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: Column(
        children: [
          Container(
            height: 5.25.h,
            width: 7.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.98.sp),
              color: type == "Selected" ?  AppColors.yellow : type == "VIP" ? AppColors.purple : type == "Regular" ? AppColors.primaryColor :  type == "Empty" ?  Colors.transparent : Color(0xffA6A6A6)
            ),
          ),
          SizedBox(height: 0.5.h,),
          Container(
            height: 1.05.h,
            width: 4.9.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.43.sp),
              color: type == "Selected" ?  AppColors.yellow : type == "VIP" ? AppColors.purple : type == "Regular" ? AppColors.primaryColor :  type == "Empty" ?  Colors.transparent : Color(0xffA6A6A6)
            ),
          ),
        ],
      ),
    );
  }

}
