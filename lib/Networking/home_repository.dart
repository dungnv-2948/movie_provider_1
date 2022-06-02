import 'package:flutter/foundation.dart';
import 'package:movie_provider/Model/movie.dart';

abstract class HomeRepository {
  Future<List<Movie>> getDataMovie(int page);
}