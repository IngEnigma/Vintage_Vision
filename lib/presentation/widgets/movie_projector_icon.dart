import 'package:flutter/material.dart';

class MovieProjectorWidget extends StatelessWidget {

  const MovieProjectorWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: Image.asset(
        'lib/assets/images/movie_projector.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
