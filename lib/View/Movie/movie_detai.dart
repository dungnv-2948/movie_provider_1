import 'package:flutter/material.dart';
import 'package:movie_provider/Model/movie.dart';
import 'package:movie_provider/Networking/api_constant.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key, required this.item}) : super(key: key);
  final Movie item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Movie Detail",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                  ApiConstant.baseImgUrl + '500' + (item.backdropPath ?? '')),
              Container(
                margin: const EdgeInsets.only(left: 16),
                height: 120,
                child: Image.network(
                    ApiConstant.baseImgUrl + '200' + (item.posterPath ?? '')),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(
                    child: Text(
                      item.voteAverage.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black, width: 0.5),
                bottom: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Review",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Trailers",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              item.overview,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
