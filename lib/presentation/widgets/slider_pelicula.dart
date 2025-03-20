import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/movie_model.dart';
import 'package:vintage_vision/presentation/screens/movie_screen.dart';

Widget sliderPelicula(BuildContext context, Movie movie) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie: movie),
        ),
      );
    },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(movie.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            movie.title,
            style: TextStyle(
              fontFamily: 'Limelight',
              color: AppColors.vintageCream,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
  );
}
