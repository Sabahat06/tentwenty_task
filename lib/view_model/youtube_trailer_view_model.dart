import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_task/model/video_data.dart';
import 'package:tentwenty_task/services/http_service.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeMovieViewModel extends ChangeNotifier {
  bool _isLoading = true;
  late YoutubePlayerController controller;
  VideoDataModel _videoDataModel = VideoDataModel();

  VideoDataModel get videoDataModel => _videoDataModel;

  YoutubeMovieViewModel() {
    setLoading(true);
  }

  @override
  void dispose() {

    super.dispose();
  }

  setUpVideoData(VideoDataModel videoDataModel) {
    _videoDataModel = videoDataModel;
  }

  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getYoutubeVideoData(String id) async {
    setLoading(true);
    _videoDataModel = (await HttpService.playVideo(id))!;
    setUpVideoData(_videoDataModel);
    controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        loop: true,
        color: 'transparent',
      ),
      initialVideoId: _videoDataModel.results!.first.key!,

    );
    setLoading(false);
  }

}