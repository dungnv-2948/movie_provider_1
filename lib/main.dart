import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_provider/Networking/home_repository_impl.dart';
import 'package:movie_provider/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

import 'View/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Provider(
          create: (_) => HomeViewModel(HomeRepositoryImpl(Client())),
          child: const HomePage()),
    );
  }
}
