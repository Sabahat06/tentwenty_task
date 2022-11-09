import 'dart:convert';

import 'package:tentwenty_task/app_config/app_api_url.dart';
import 'package:tentwenty_task/model/movie_detail_model.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:tentwenty_task/model/video_data.dart';

class HttpService {

  static Future<UpcomingMoviesModel?> getUpcomingMovies() async {
    Uri _uri = Uri.parse(AppRoute.upcomingMoviePath);
    try {
      var response = await http.get(
        _uri,
      );
      if (response.statusCode == 200) {
        return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      return null;
    }
  }

  static Future<MovieDetailModel?> getMovieDetail(String movieID) async {
    Uri _uri = Uri.parse("https://api.themoviedb.org/3/movie/${movieID}?api_key=7426471606c35de8668c3a3fc475203e&language=en-US");
    try {
      var response = await http.get(
        _uri,
      );
      if (response.statusCode == 200) {
        return MovieDetailModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      return null;
    }
  }

  static Future<VideoDataModel?> playVideo(String movieID) async {
    Uri _uri = Uri.parse("https://api.themoviedb.org/3/movie/${movieID}/videos?api_key=7426471606c35de8668c3a3fc475203e&language=en-US");
    try {
      var response = await http.get(
        _uri,
      );
      if (response.statusCode == 200) {
        return VideoDataModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      return null;
    }
  }

}