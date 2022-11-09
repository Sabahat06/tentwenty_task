import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_colors.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/view_model/youtube_trailer_view_model.dart';
import 'package:tentwenty_task/widgets/my_filled_button.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class YoutubeTrailerVideo extends StatefulWidget {
  String movieID;
  YoutubeTrailerVideo({required this.movieID});
  @override
  _YoutubeTrailerVideoState createState() => _YoutubeTrailerVideoState();
}

class _YoutubeTrailerVideoState extends State<YoutubeTrailerVideo> {
  bool hideTopMenu = true;

  @override
  Widget build(BuildContext context) {
    final youtubeTrailerViewModel = Provider.of<YoutubeMovieViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              child: youtubeTrailerViewModel.loading
                ? const Center(child: CircularProgressIndicator(),)
                : YoutubePlayerControllerProvider(
                  controller: youtubeTrailerViewModel.controller,
                  child: YoutubePlayerIFrame(
                    controller: youtubeTrailerViewModel.controller,
                  ),
                ),
            ),
            youtubeTrailerViewModel.loading
              ? SizedBox(height: 0.h, width: 0.w,)
              : Positioned(
                right: 10.w,
                bottom: 75.h,
                child: MyFilledButton(
                  height: 40.h,
                  width: 70.w,
                  color: AppColors.primaryColor,
                  txt: "Done",
                  ontap: () {
                    youtubeTrailerViewModel.controller.close();
                    AppUtils.pop(context: context);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}