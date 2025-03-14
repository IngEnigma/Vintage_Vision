import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/movie_model.dart';
import 'package:vintage_vision/presentation/screens/movie_screen.dart';

Widget listPelicula(BuildContext context, Movie movie) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie: movie),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(right: 12.0),
      width: 180.0,
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280.0,
            width: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: NetworkImage(movie.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            movie.title,
            style: TextStyle(
              fontFamily: 'Limelight',
              color: AppColors.vintageCream,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
  );
}
