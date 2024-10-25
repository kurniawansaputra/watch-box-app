import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class MajorFilmStudiosSection extends StatefulWidget {
  const MajorFilmStudiosSection({super.key});

  @override
  State<MajorFilmStudiosSection> createState() =>
      _MajorFilmStudiosSectionState();
}

class _MajorFilmStudiosSectionState extends State<MajorFilmStudiosSection> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _FilmStudiosRow(
            imagePaths: [
              'assets/images/sony_pictures.png',
              'assets/images/paramount_pictures.png',
              'assets/images/warner_bros.png',
            ],
            titles: [
              'Sony Pictures',
              'Paramount Pictures',
              'Warner Bros',
            ],
          ),
          _FilmStudiosRow(
            imagePaths: [
              'assets/images/walt_disney.png',
              'assets/images/universal_pictures.png',
            ],
            titles: [
              'Walt Disney',
              'Universal Pictures',
            ],
          ),
        ],
      ),
    );
  }
}

class _FilmStudiosRow extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> titles;

  const _FilmStudiosRow({required this.imagePaths, required this.titles});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: imagePaths
          .map((imagePath) => Expanded(
                child: _MajorFilmStudios(
                    imagePath: imagePath,
                    title: titles[imagePaths.indexOf(imagePath)]),
              ))
          .toList(),
    );
  }
}

class _MajorFilmStudios extends StatelessWidget {
  final String imagePath;
  final String title;

  const _MajorFilmStudios({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toastification.show(
          context: context,
          primaryColor: Colors.white,
          backgroundColor: Colors.black,
          foregroundColor: Colors.black,
          style: ToastificationStyle.fillColored,
          showProgressBar: false,
          title: Text(
            'List of Movies by $title',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          autoCloseDuration: const Duration(seconds: 5),
          showIcon: false,
        );
      },
      child: SizedBox(
        height: 70.0,
        child: Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
