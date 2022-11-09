import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_task/model/movie_detail_model.dart';
import 'package:tentwenty_task/services/http_service.dart';

class MovieDetailViewModel extends ChangeNotifier {
  bool _isLoading = true;
  MovieDetailModel _movieDetailModel = MovieDetailModel();

  MovieDetailModel get movieDetailModel => _movieDetailModel;
  setUpcomingMovieModel(MovieDetailModel upcomingMoviesModel) {
    _movieDetailModel = upcomingMoviesModel;
  }

  MovieDetailViewModel() {
    // getMovieDetail(StaticVariable.MovieId!);
  }

  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getMovieDetail(String id) async {
    setLoading(true);
    _movieDetailModel = (await HttpService.getMovieDetail(id))!;
    DateTime releaseDate =  DateTime.parse(_movieDetailModel.releaseDate!);
    _movieDetailModel.releaseDate = DateFormat("yMMMMd").format(releaseDate);
    setUpcomingMovieModel(_movieDetailModel);
    setLoading(false);
  }
}