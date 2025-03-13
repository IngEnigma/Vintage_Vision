import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/presentation/widgets/custom_app_bar.dart';
import 'package:vintage_vision/presentation/widgets/list_pelicula.dart';
import 'package:vintage_vision/presentation/widgets/slider_pelicula.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  static final List<String> movieCarousselUrl=[
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/The_Big_Show_Poster.jpg/500px-The_Big_Show_Poster.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ironmaskposter.jpg/500px-Ironmaskposter.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/The_Sin_of_Nora_Moran_FilmPoster.jpg/500px-The_Sin_of_Nora_Moran_FilmPoster.jpg"
  ];

  static final List<String> movieTitle=[
    "The Big Show",
    "Iron mask",
    "The Sin of Nora Moran"
  ];

  static final List<String> movieImgURL=[
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/The_Star_Packer_FilmPoster.jpeg/500px-The_Star_Packer_FilmPoster.jpeg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Suddenly_%281954%29.jpg/500px-Suddenly_%281954%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Poster_for_The_Screaming_Skull.jpg/500px-Poster_for_The_Screaming_Skull.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ironmaskposter.jpg/500px-Ironmaskposter.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/SingSong6PantsOneSheet47.JPG/500px-SingSong6PantsOneSheet47.JPG",
    "https://upload.wikimedia.org/wikipedia/commons/d/de/The-eagle-1925.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50.0),
        child: CustomAppBar()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
          child: Column(
            children: [
              Text(
                'Peliculas Recomendadas',
                style: TextStyle(
                  fontFamily: 'Limelight',
                  color: AppColors.vintageCream,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 12.0,),
              //Carrusel
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  height: 280.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  sliderPelicula(movieCarousselUrl[0],movieTitle[0]),
                  sliderPelicula(movieCarousselUrl[1],movieTitle[1]),
                  sliderPelicula(movieCarousselUrl[2],movieTitle[2])
                ],
              ),
              Text(
                'Para ti:',
                style: TextStyle(
                  color: AppColors.vintageCream,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Limelight',
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                height: 360.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //Lista Peliculas
                    listPelicula(movieImgURL[0], "nameMovie"),
                    listPelicula(movieImgURL[1], "nameMovie"),
                    listPelicula(movieImgURL[2], "nameMovie"),
                    listPelicula(movieImgURL[3], "nameMovie"),
                  ],
                ),
              ),
              Text(
                'Comedias:',
                style: TextStyle(
                  color: AppColors.vintageCream,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Limelight',
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                height: 360.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //Lista Peliculas
                    listPelicula(movieImgURL[4], "nameMovie"),
                    listPelicula(movieImgURL[5], "nameMovie"),
                    listPelicula(movieImgURL[3], "nameMovie"),
                    listPelicula(movieImgURL[2], "nameMovie"),
                  ],
                ),
              ),
            ],
          ), 
        ) ,
      ),
    );
  }
}