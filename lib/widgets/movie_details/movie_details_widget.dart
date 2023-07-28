import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lorem(paragraphs: 1, words: 5)),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            MovieDetailsMainInfoWidget(),
            SizedBox(height: 30),
            MovieDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
