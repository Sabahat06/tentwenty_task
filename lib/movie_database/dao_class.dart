import 'package:floor/floor.dart';
import 'package:tentwenty_task/model/upcoming_movie_model.dart';

@dao
abstract class ResultsDAO {

  @insert
  Future<List<int>> insertResult(List<Results> movie);

  @Query('SELECT * FROM Results')
  Future<List<Results>> retrieveResult();

  @Query('DELETE FROM Results')
  Future<Results?> deleteResult();

}
