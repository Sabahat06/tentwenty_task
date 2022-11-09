import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:tentwenty_task/model/movie_detail_model.dart';
import 'package:tentwenty_task/view/seating_screen.dart';
import 'package:tentwenty_task/view/youtube_trailer_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:tentwenty_task/view_model/youtube_trailer_view_model.dart';
import 'package:tentwenty_task/widgets/my_filled_button.dart';

class MovieDetailScreen extends StatelessWidget {
  String movieId;
  MovieDetailScreen(this.movieId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetailViewModel = Provider.of<MovieDetailViewModel>(context);
    final youtubeTrailerViewModel = Provider.of<YoutubeMovieViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.backgroundColor,
          child: movieDetailViewModel.loading
            ? Container(child: const Center(child: CircularProgressIndicator()),)
            : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 466.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/w500/${movieDetailViewModel.movieDetailModel.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 66.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30.h,
                                width: 102.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${movieDetailViewModel.movieDetailModel.backdropPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h,),
                              Text("In Theaters ${movieDetailViewModel.movieDetailModel.releaseDate}", style: AppStyles.commonTextStyle(Colors.white),),
                              SizedBox(height: 15.h,),
                              MyFilledButton(
                                height: 50.h,
                                borderRadius: 10.sp,
                                ontap: () {
                                  AppUtils.pushRoute(context: context, route: SeatingScreen(movieDetailViewModel));
                                },
                                txt: "Get Tickets",
                              ),
                              SizedBox(height: 10.h,),
                              GestureDetector(
                                onTap: () {
                                  youtubeTrailerViewModel.getYoutubeVideoData(movieId);
                                  AppUtils.pushRoute(context: context, route: YoutubeTrailerVideo(movieID: movieDetailViewModel.movieDetailModel.id.toString(),));
                                },
                                child: Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(color: AppColors.primaryColor, width: 2)
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 12.h,
                                          width: 8.w,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(AppConstants.playIcon),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w,),
                                        Text("Watch Trailer", style: AppStyles.commonTextStyle(Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 34.h,),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(top: 36.h, left: 24.w),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {AppUtils.pop(context: context);},
                                child: Container(
                                  height: 15.h,
                                  width: 7.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppConstants.backIcon),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: 26.w,),
                              Text('Watch', style: AppStyles.commonTextStyle(Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Genres', style: AppStyles.commonTextStyle(AppColors.textColor),),
                        SizedBox(height: 24.h,),
                        Container(
                          height: 24.h,
                          width: double.infinity,
                          child: ListView.separated(
                            itemCount: movieDetailViewModel.movieDetailModel.genres!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return renderingGenres(movieDetailViewModel.movieDetailModel.genres![index]);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(width: 5.w,);
                            },
                          ),
                        ),
                        SizedBox(height: 22.h,),
                        const Divider(color: AppColors.descriptionTextColor,),
                        SizedBox(height: 15.h,),
                        Text('Overview', style: AppStyles.commonTextStyle(AppColors.textColor),),
                        SizedBox(height: 14.h,),
                        Text(movieDetailViewModel.movieDetailModel.overview!, style: AppStyles.descriptionTextStyle(),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
        )
      ),
    );
  }

  renderingGenres(Genres genres) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: genres.color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        child: Text(genres.name!, style: AppStyles.genresTextStyle()),
      ),
    );
  }

}