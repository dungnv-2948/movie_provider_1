import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_provider/Model/movie.dart';
import 'package:movie_provider/Networking/api_constant.dart';
import 'package:movie_provider/Networking/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final Client _client;

  HomeRepositoryImpl(this._client);

  @override
  Future<List<Movie>> getDataMovie(int page) async {
    final queryParameter = {
      "api_key": ApiConstant.apiKey,
      "language": "en-US",
      "page": "$page",
    };

    final response = await _client.get(
      Uri.https(ApiConstant.baseUrl, ApiConstant.GET_MOVIE, queryParameter),
    );
    List<Movie> result = [];
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final jsonResult = json["results"];
      result = List.from(jsonResult as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();
    }
    return result;
  }
}
