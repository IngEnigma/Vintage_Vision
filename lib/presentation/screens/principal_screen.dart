import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/movie_model.dart';
import 'package:vintage_vision/presentation/widgets/custom_app_bar.dart';
import 'package:vintage_vision/presentation/widgets/custom_drawer.dart';
import 'package:vintage_vision/presentation/widgets/list_pelicula.dart';
import 'package:vintage_vision/presentation/widgets/slider_pelicula.dart';

class PrincipalScreen extends StatelessWidget {
  PrincipalScreen({super.key});

  final List<Movie> movies = [
    Movie(
      id: "1",
      title: "The Big Show",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/The_Big_Show_Poster.jpg/500px-The_Big_Show_Poster.jpg",
      year: 1934,
      genre: "Western",
      url: "lib/assets/video/2073224.mp4",
      description:
          "Un sheriff investiga a una banda de criminales en su pueblo.",
    ),
    Movie(
      id: "1",
      title: "Iron Mask",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ironmaskposter.jpg/500px-Ironmaskposter.jpg",
      year: 2019,
      url: "lib/assets/video/7864918.mp4",
      genre: "Aventura",
      description: "Exploradores buscan un legendario tesoro en China.",
    ),
    Movie(
      id: "1",
      title: "The Sin of Nora Moran",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/The_Sin_of_Nora_Moran_FilmPoster.jpg/500px-The_Sin_of_Nora_Moran_FilmPoster.jpg",
      year: 1933,
      url: "lib/assets/video/13203001.mp4",
      genre: "Drama",
      description: "La trágica historia de una mujer condenada a muerte.",
    ),
  ];

  final List<Movie> comedyMovies = [
    Movie(
      id: "1",
      title: "Sing Song 6 Pants",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/SingSong6PantsOneSheet47.JPG/500px-SingSong6PantsOneSheet47.JPG",
      year: 1947,
      genre: "Comedia",
      description: "Un grupo de amigos se mete en problemas en una tintorería.",
    ),
    Movie(
      id: "1",
      title: "The Eagle",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/d/de/The-eagle-1925.jpg",
      year: 1925,
      genre: "Romance",
      description: "Un oficial ruso se convierte en un forajido justiciero.",
    ),
    Movie(
      id: "1",
      title: "Santa Fe Trail",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Santa_Fe_Trail_De_Havilland_Flynn.jpg/500px-Santa_Fe_Trail_De_Havilland_Flynn.jpg",
      year: 1920,
      genre: "Romance",
      description:
          "Santa Fe Trail is a 1940 American Western prelude to the Civil War.",
    ),
    Movie(
      id: "1",
      title: "The Eagle",
      thumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/The_Vagabond_%281916%29.jpg/500px-The_Vagabond_%281916%29.jpg",
      year: 1916,
      genre: "Romance",
      description:
          "The story begins with Charlie, the Tramp, arriving at a bar, playing on a violin to raise money and exciting rivalry with competing musicians - which results in a bar room brawl and comic mayhem.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50.0),
        child: CustomAppBar(),
      ),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                'Películas Recomendadas',
                style: TextStyle(
                  fontFamily: 'Limelight',
                  color: AppColors.vintageCream,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // Carrusel de películas
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  height: 275.0,
                  enlargeCenterPage: true,
                ),
                items:
                    movies.map((movie) {
                      return sliderPelicula(context, movie);
                    }).toList(),
              ),
              SizedBox(height: 10.0),
              
              Text(
                'Para ti:',
                style: TextStyle(
                  color: AppColors.vintageCream,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Limelight',
                ),
              ),
              SizedBox(height: 5.0),

              // Lista horizontal de películas recomendadas
              SizedBox(
                height: 330.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return listPelicula(context, movies[index]);
                  },
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
              SizedBox(height: 5.0),

              // Lista horizontal de películas de comedia
              SizedBox(
                height: 330.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: comedyMovies.length,
                  itemBuilder: (context, index) {
                    return listPelicula(context, comedyMovies[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}