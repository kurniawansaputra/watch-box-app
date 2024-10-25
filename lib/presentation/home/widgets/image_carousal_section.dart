import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageCarouselSection extends StatefulWidget {
  final List<String> imgList;
  final List<String> titles;
  final List<String> movieIds;

  const ImageCarouselSection(
      {super.key,
      required this.imgList,
      required this.titles,
      required this.movieIds});

  @override
  State<ImageCarouselSection> createState() => _ImageCarouselSectionState();
}

class _ImageCarouselSectionState extends State<ImageCarouselSection> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders =
        widget.imgList.asMap().entries.map((entry) {
      int index = entry.key;
      String item = entry.value;
      String title = widget.titles[index];
      String movieId = widget.movieIds[index];

      return GestureDetector(
        onTap: () {
          context.push('/dashboard/movie/$movieId');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: 206.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 16.0 : 6.0,
                height: 6.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
