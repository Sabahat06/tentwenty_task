import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/movie_database/result_database.dart';
import 'package:tentwenty_task/services/http_service.dart';

class UpcomingMovieViewModel extends ChangeNotifier {
  bool _isLoading = false;
  late ResultDatabase myDatabase;
  UpcomingMoviesModel _upcomingMoviesModel = UpcomingMoviesModel();

  UpcomingMovieViewModel() {
    getUpcomingMovie();
  }

  UpcomingMoviesModel get upcomingMovieMovie => _upcomingMoviesModel;
  setUpcomingMovieModel(UpcomingMoviesModel upcomingMoviesModel) {
    _upcomingMoviesModel = upcomingMoviesModel;
    notifyListeners();
  }

  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getUpcomingMovie() async {
    setLoading(true);
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == false) {
      $FloorResultDatabase.databaseBuilder('result_database.db').build().then((value) async {
        myDatabase = value;
        List<Results> data = await retrieveResult();
        _upcomingMoviesModel.results=data;
        setLoading(false);
      });

    }
    else {
      _upcomingMoviesModel = (await HttpService.getUpcomingMovies())!;
      setUpcomingMovieModel(_upcomingMoviesModel);
      setLoading(false);
      await saveData(_upcomingMoviesModel.results!);
    }
  }

  /// Database Function

  saveData(List<Results> movie) async {
    $FloorResultDatabase.databaseBuilder('result_database.db').build().then((value) async {
      myDatabase = value;
      List<Results> data = await retrieveResult();
      if(data.isNotEmpty) {
        await myDatabase.resultsDAO.deleteResult();
      }
      await myDatabase.resultsDAO.insertResult(_upcomingMoviesModel.results!);
    });
  }

  Future<List<Results>> retrieveResult() async {
    return await myDatabase.resultsDAO.retrieveResult();
  }

}