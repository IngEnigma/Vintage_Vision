import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';

Widget listPelicula(String img, String nameMovie){
  return Container(
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
              image: NetworkImage(img),
              fit: BoxFit.cover 
            )
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          nameMovie,
          style: TextStyle(
            fontFamily: 'Limelight',
            color: AppColors.vintageCream,
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}