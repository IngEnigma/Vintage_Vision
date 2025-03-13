import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';

Widget sliderPelicula(String img, String nameMovie){
  return Container(
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
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
          ) ,
        ),
        SizedBox(height: 15.0),
        Text(
          nameMovie, 
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