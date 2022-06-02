import 'package:flutter/material.dart';
import 'package:movie_provider/Model/movie.dart';
import 'package:movie_provider/Networking/api_constant.dart';
import 'package:movie_provider/View/Movie/movie_detai.dart';
import 'package:movie_provider/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel;

  Future<void> loadMoreMovie() async {
    if (!viewModel.loading) {
      viewModel.page += 1;
      viewModel.loading = true;
      await viewModel.getData(viewModel.page);
      viewModel.loading = false;
    }
  }

  Future<void> initData() async {
    viewModel.page = ApiConstant.PAGE_BEGIN;
    viewModel.loading = false;
    await viewModel.getData(viewModel.page);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    viewModel = context.read<HomeViewModel>();
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Popular",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (viewModel.canLoadMore &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            loadMoreMovie();
          }
          return true;
        },
        child: StreamBuilder<List<Movie>>(
          stream: viewModel.movieStream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            return snapshot.data != null
                ? data.isNotEmpty
                    ? ListView.builder(
                        itemCount: viewModel.canLoadMore
                            ? viewModel.count + 1
                            : viewModel.count,
                        itemBuilder: (context, index) {
                          final data = snapshot.data ?? [];
                          return index >= data.length
                              ? const SizedBox(
                                  height: 180,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : _itemMovie(data[index]);
                        },
                      )
                    : const Center(
                        child: Text("No data"),
                      )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _itemMovie(Movie item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(item: item),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        height: 180,
        width: double.infinity,
        child: Row(
          children: [
            Image.network(
                ApiConstant.baseImgUrl + '200' + (item.posterPath ?? '')),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    item.overview,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
