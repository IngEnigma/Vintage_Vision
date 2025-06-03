import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/movie_model.dart';
import 'package:vintage_vision/presentation/widgets/button_red_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_drawer.dart';

import 'package:vintage_vision/presentation/screens/movieplayer_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        title: const Text(
          'Pelicula',
          style: TextStyle(
            fontFamily: 'Limelight',
            color: AppColors.vintageCream,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.vintageCream),
          onPressed: () =>  Navigator.pop(context)
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Póster centrado
                  Center(
                    child: ClipRRect(
                      child: Image.network(
                        movie.thumbnail,
                        width: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),
                  // Título de la película
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontFamily: 'Limelight',
                      color: AppColors.vintageCream,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  _buildInfoRow('Año', '${movie.year}'),
                  _buildInfoRow('Género', movie.genre),
                  // Descripción de la película
                  Text(
                    movie.description,
                    style: const TextStyle(
                      fontFamily: 'Limelight',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14.0,
                    ),
                  ),

                  const SizedBox(height: 40.0),
                  // Botón de reproducción

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonRedWidget(
                        text: 'Reproducir',
                        onPressed: () {  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviePlayerScreen(movie: movie),
                            ),
                          );
                        },
                      ),
                      ButtonRedWidget(
                        text: 'Ver con Amigos',
                        onPressed: () {  
                          //Hola chucho
                        },
                      ),
                    ]
                  ),

                  /*ButtonRedWidget(
                    text: 'Reproducir',
                    onPressed: () {
                      //Hola chucho
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ButtonRedWidget(
                    text: 'Ver con Amigos',
                    onPressed: () {
                      //Hola chucho
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // Centra los textos
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              color: AppColors.vintageCream,
              fontFamily: 'Limelight',
              fontSize: 16.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.vintageCream,
              fontSize: 16.0,
              fontFamily: 'Limelight',
            ),
          ),
        ],
      ),
    );
  }
}