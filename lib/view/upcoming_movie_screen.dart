import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/view/movie_detail_screen.dart';
import 'package:tentwenty_task/view/search_movie_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:tentwenty_task/view_model/upcoming_movie_view_model.dart';

class UpcomingMovieScreen extends StatelessWidget {
  const UpcomingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final upcomingMovieViewModel = Provider.of<UpcomingMovieViewModel>(context);
    final movieDetailViewModel = Provider.of<MovieDetailViewModel>(context,);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Watch', style: AppStyles.commonTextStyle(AppColors.textColor),),
                  GestureDetector(
                    onTap: () {
                      AppUtils.pushRoute(context: context, route: SearchMovieScreen());
                    },
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppConstants.searchIcon),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h,),
            Container(height: 30.h, color: AppColors.backgroundColor,),
            Expanded(
              child: Consumer(
                builder: (context, upcomingMovieModel, child) {
                  return Container(
                    color: AppColors.backgroundColor,
                    child: upcomingMovieViewModel.loading
                      ? Container(height: 500, child: const Center(child: CircularProgressIndicator()),)
                      : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ListView.separated(
                          itemCount: upcomingMovieViewModel.upcomingMovieMovie.results!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return UpcomingMovieContainer(upcomingMovieViewModel.upcomingMovieMovie.results![index], context, movieDetailViewModel);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 20.h,);
                          },
                        ),
                    ),
                  );
                }
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget UpcomingMovieContainer(Results movie, BuildContext context, MovieDetailViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.getMovieDetail(movie.id.toString());
        AppUtils.pushRoute(context: context, route: MovieDetailScreen(movie.id.toString()));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              image: DecorationImage(
                image: CachedNetworkImageProvider('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                fit: BoxFit.cover,
              )
            ),
            // child: CachedNetworkImage(
            //   imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            //   fit: BoxFit.cover,
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,),
            // ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Text(movie.title!, style: AppStyles.titleTextStyle(),),
          ),
        ],
      ),
    );
  }
}
