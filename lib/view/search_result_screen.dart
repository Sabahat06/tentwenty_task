import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/view/movie_detail_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';

class SearchResultScreen extends StatelessWidget {
  List<Results>? movies;

  SearchResultScreen(this.movies);
  @override
  Widget build(BuildContext context) {
    final movieDetailViewModel = Provider.of<MovieDetailViewModel>(context,);
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.backgroundColor,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
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
                        SizedBox(width: 25.w,),
                        Text("${movies!.length} Results found", style: AppStyles.commonTextStyle(AppColors.black),),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h,),

                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.separated(
                  itemCount: movies!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return UpcomingMovieContainer(movies![index], context, movieDetailViewModel);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h,);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget UpcomingMovieContainer(Results movie, BuildContext context, MovieDetailViewModel viewModel,) {
    return GestureDetector(
      onTap: () {
        viewModel.getMovieDetail(movie.id.toString());
        AppUtils.pushRoute(context: context, route: MovieDetailScreen(movie.id.toString()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 130.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20.w,),
              Container(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title!, style: AppStyles.commonTextStyle(AppColors.black), overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 8.h,),
                    Text(movie.originalLanguage!, style: AppStyles.commonTextStyle(AppColors.grey),),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 20.w,
            height: 4.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.moreVertIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
