import 'dart:async';

import 'package:movie_provider/Model/movie.dart';
import 'package:movie_provider/Networking/home_repository_impl.dart';

class HomeViewModel {
  final HomeRepositoryImpl homeRepositoryImpl;

  HomeViewModel(this.homeRepositoryImpl);

  int page = 1;
  bool loading = false;
  bool canLoadMore = true;
  List<Movie> listMovie = [];

  int get count => listMovie.length;
  final _streamController = StreamController<List<Movie>>();
  Stream<List<Movie>> get movieStream => _streamController.stream;
  Future<void> getData(int page) async {
    final result = await homeRepositoryImpl.getDataMovie(page);
    canLoadMore = result.length >= 20;
    listMovie.addAll(result);
    _streamController.sink.add(listMovie);
  }
  void dispose(){
    _streamController.close();
  }
}
