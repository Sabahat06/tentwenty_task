import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tentwenty_task/model/upcoming_movie_model.dart';
import 'package:tentwenty_task/movie_database/dao_class.dart';


part 'result_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Results])
abstract class ResultDatabase extends FloorDatabase {
  ResultsDAO get resultsDAO;
}
