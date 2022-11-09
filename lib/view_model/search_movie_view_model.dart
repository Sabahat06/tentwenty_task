import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_task/app_config/app_keys.dart';
import 'package:tentwenty_task/app_config/app_utils.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/view_model/upcoming_movie_view_model.dart';

class SearchMovieViewModel extends ChangeNotifier {
  final upcomingMovieViewModel = Provider.of<UpcomingMovieViewModel>(AppKeys.mainNavigatorKey.currentContext!);
  TextEditingController searchController = TextEditingController();
  UpcomingMoviesModel _upcomingMoviesModel = UpcomingMoviesModel();

  UpcomingMoviesModel get upcomingMovieMovie => _upcomingMoviesModel;

  List<Map> imagesListAndTitle = [
    {
      "title" : "Comedies",
      "imagePath" : "assets/image/search_images/comedies.png"
    },
    {
      "title" : "Crime",
      "imagePath" : "assets/image/search_images/crime.png"
    },
    {
      "title" : "Family",
      "imagePath" : "assets/image/search_images/family.png"
    },
    {
      "title" : "Documentaries",
      "imagePath" : "assets/image/search_images/documentaries.png"
    },
    {
      "title" : "Drama",
      "imagePath" : "assets/image/search_images/dramas.png"
    },
    {
      "title" : "Fantasy",
      "imagePath" : "assets/image/search_images/fantasy.png"
    },
    {
      "title" : "Holiday",
      "imagePath" : "assets/image/search_images/holiday.png"
    },
    {
      "title" : "Horror",
      "imagePath" : "assets/image/search_images/horror.png"
    },
    {
      "title" : "Sci-Fi",
      "imagePath" : "assets/image/search_images/sci_fi.png"
    },
    {
      "title" : "Thriller",
      "imagePath" : "assets/image/search_images/thriller.png"
    },
  ];

  setUpcomingMovieModel(UpcomingMoviesModel upcomingMoviesModel) {
    _upcomingMoviesModel = upcomingMoviesModel;
    notifyListeners();
  }

  searchingMovie(String value) {
    _upcomingMoviesModel.results = upcomingMovieViewModel.upcomingMovieMovie.results!.where((element) =>
    element.title!.toLowerCase().contains(value.toLowerCase()) || element.title!.startsWith(value)).toList();
    setUpcomingMovieModel(_upcomingMoviesModel);
    print(_upcomingMoviesModel.results);
  }

  clearSearch() {
    _upcomingMoviesModel.results = null;
    searchController.clear();
    notifyListeners();
  }

  backToMovieScreen(BuildContext context) {
    if(searchController.text == '') {
      AppUtils.pop(context: context);
    }
  }

}