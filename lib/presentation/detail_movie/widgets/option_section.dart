import 'package:flutter/material.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Watchlist',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 24.0,
        ),
        Column(
          children: [
            Icon(
              Icons.share,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Share',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 24.0,
        ),
        Column(
          children: [
            Icon(
              Icons.download,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Download',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
