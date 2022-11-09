import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_constants.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/app_config/styles.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/view/movie_detail_screen.dart';
import 'package:tentwenty_task/view/search_result_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:tentwenty_task/view_model/search_movie_view_model.dart';
import 'package:tentwenty_task/widgets/my_text_field.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchMovieViewModel = Provider.of<SearchMovieViewModel>(context);
    final movieDetailViewModel = Provider.of<MovieDetailViewModel>(context,);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                        height: 52.h,
                        width: double.infinity,
                        child: MyTextField(
                          controller: searchMovieViewModel.searchController,
                          hintText: "TV Shows, movies and more",
                          prefixIcon: AppConstants.searchIcon,
                          suffixIcon: AppConstants.clearIcon,
                          onChanged: (value) {
                            searchMovieViewModel.searchingMovie(value);
                          },
                          onSuffixIconTap: () {
                            searchMovieViewModel.backToMovieScreen(context);
                            searchMovieViewModel.clearSearch();
                          },
                          onEditingComplete: () {
                            AppUtils.pushRoute(context: context, route: SearchResultScreen(searchMovieViewModel.upcomingMovieMovie.results));
                          },
                        )
                    ),
                  ),
                  SizedBox(height: 24.h,),

                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.only(left:20.w, right: 20.w, top: 30.h),
                  child: searchMovieViewModel.upcomingMovieMovie.results == null || searchMovieViewModel.upcomingMovieMovie.results!.length==0
                    ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1.9.sp
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchMovieViewModel.imagesListAndTitle.length,
                      itemBuilder: (BuildContext context, int index) {
                        return renderingCategories(searchMovieViewModel.imagesListAndTitle[index], context);
                      }
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h,),
                        Text('Top Results', style: AppStyles.commonTextStyle(AppColors.black),),
                        SizedBox(height: 10.h,),
                        const Divider(color: AppColors.descriptionTextColor,),
                        SizedBox(height: 20.h,),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchMovieViewModel.upcomingMovieMovie.results!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return UpcomingMovieContainer(searchMovieViewModel.upcomingMovieMovie.results![index], context, movieDetailViewModel, searchMovieViewModel);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 20.h,);
                          },
                        ),
                      ],
                    )
                ),
              )
            ),
          ],
        )
      ),
    );
  }

  Widget UpcomingMovieContainer(Results movie, BuildContext context, MovieDetailViewModel viewModel, SearchMovieViewModel searchMovieViewModel) {
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

  renderingCategories(Map data, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 165.w,
          height: 100.h,
          decoration: BoxDecoration(
            // color: Colors.green,
            borderRadius: BorderRadius.circular(10.sp),
            image: DecorationImage(
              image: AssetImage(data["imagePath"]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 10.w,
          child: Text(data["title"], style: AppStyles.commonTextStyle(Colors.white),),
        ),
      ],
    );
  }

}
