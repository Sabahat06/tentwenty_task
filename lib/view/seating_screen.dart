import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:tentwenty_task/view/seating_detail_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/view_model/seating_view_model.dart';
import 'package:tentwenty_task/widgets/my_filled_button.dart';

class SeatingScreen extends StatelessWidget {
  MovieDetailViewModel movieDetailViewModel;
  int isSelected = 0;

  SeatingScreen(this.movieDetailViewModel);
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
            SizedBox(height: 90.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date:", style: AppStyles.commonTextStyle(AppColors.black),),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    height: 35,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: seatingViewModel.dates.length,
                      itemBuilder: (context, index) {
                        return renderingDates(seatingViewModel.dates[index], index, seatingViewModel);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 12.w,);
                      },
                    ),
                  ),
                  SizedBox(height: 35.h,),
                  Container(
                    height: 225.h,
                    child: ListView.separated(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return renderingSeats(index, seatingViewModel);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10.w,);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyFilledButton(
                width: double.infinity,
                height: 50.h,
                color: AppColors.primaryColor,
                borderRadius: 10.sp,
                txt: "Select Seat",
                ontap: () {
                  AppUtils.pushRoute(context: context, route: SeatingDetailScreen(movieDetailViewModel));
                },
              ),
            ),
            SizedBox(height: 25.h,),
          ],
        ),
      ),
    );
  }

  Widget renderingSeats(int index, SeatingViewModel seatViewModel) {
    return GestureDetector(
      onTap: () {
        seatViewModel.selectSeating(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('12:30  ', style: TextStyle(fontSize: 16.sp, color: AppColors.black, fontWeight: FontWeight.w700),),
              Text('Cinetech + hall 1', style: TextStyle(fontSize: 16.sp, color: AppColors.descriptionTextColor),),
            ],
          ),
          SizedBox(height: 5.h,),
          Container(
            width: 250.w,
            height: 145.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: seatViewModel.isSeatSelected == index ? AppColors.primaryColor : AppColors.grey)
            ),
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for(int i = 1; i<= 10; i++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
//                        Container(width: 15.sp, height: 15.sp, child: Text(i.toString(), style: TextStyle(fontSize: 8.sp, color: AppColors.black),)),
//                        Spacer(),
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
                ],
              ),
            ),
          ),

          SizedBox(height: 5.h,),
          Row(
            children: [
              Text('From ', style: TextStyle(fontSize: 16.sp, color: AppColors.descriptionTextColor),),
              Text('12\$', style: TextStyle(fontSize: 16.sp, color: AppColors.black, fontWeight: FontWeight.w700),),
              Text(' or ', style: TextStyle(fontSize: 16.sp, color: AppColors.descriptionTextColor),),
              Text('2500 bonus', style: TextStyle(fontSize: 16.sp, color: AppColors.black, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    );
  }

  Widget seatWidget(String type) {
    return Padding(
      padding: EdgeInsets.all(2.5.sp),
      child: Column(
        children: [
          Container(
            height: 2.3.h,
            width: 3.07.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.98.sp),
              color: type == "Selected" ?  AppColors.yellow : type == "VIP" ? AppColors.purple : type == "Regular" ? AppColors.primaryColor :  type == "Empty" ?  Colors.transparent : Color(0xffA6A6A6)
            ),
          ),
          SizedBox(height: 0.5.h,),
          Container(
            height: 0.45.h,
            width: 2.15.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.43.sp),
              color: type == "Selected" ?  AppColors.yellow : type == "VIP" ? AppColors.purple : type == "Regular" ? AppColors.primaryColor :  type == "Empty" ?  Colors.transparent : Color(0xffA6A6A6)
            ),
          ),
        ],
      ),
    );
  }



  renderingDates(String date, int index, SeatingViewModel seatViewModel) {
    return GestureDetector(
      onTap: () {
        seatViewModel.selectDate(index);
      },
      child: Container(
        width: 67.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: seatViewModel.isSelected == index ? AppColors.primaryColor : Color(0xffA6A6A6).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Center(
          child: Text(date, style: TextStyle(fontSize: 12.sp, color: seatViewModel.isSelected == index ?  Colors.white : AppColors.black)),
        ),
      ),
    );
  }

}
