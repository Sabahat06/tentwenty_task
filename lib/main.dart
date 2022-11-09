import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_keys.dart';
import 'package:tentwenty_task/view/upcoming_movie_screen.dart';
import 'package:tentwenty_task/view_model/movie_detail_view_model.dart';
import 'package:tentwenty_task/view_model/search_movie_view_model.dart';
import 'package:tentwenty_task/view_model/seating_view_model.dart';
import 'package:tentwenty_task/view_model/upcoming_movie_view_model.dart';
import 'package:tentwenty_task/view_model/youtube_trailer_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UpcomingMovieViewModel()),
            ChangeNotifierProvider(create: (_) => MovieDetailViewModel()),
            ChangeNotifierProvider(create: (_) => YoutubeMovieViewModel()),
            ChangeNotifierProvider(create: (_) => SearchMovieViewModel()),
            ChangeNotifierProvider(create: (_) => SeatingViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppKeys.mainNavigatorKey,
            title: 'Ten Twenty',
            theme: ThemeData(
              fontFamily: 'Poppins',
              accentColor: AppColors.primaryColor,
              primaryColor: AppColors.primaryColor,
            ),
            home: child,
          ),
        );
      },
      child: UpcomingMovieScreen(),
    );
  }
}

