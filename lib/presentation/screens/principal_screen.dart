import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/movie_model.dart';
import 'package:vintage_vision/core/models/profile_model.dart';
import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/presentation/widgets/custom_app_bar.dart';
import 'package:vintage_vision/presentation/widgets/custom_drawer.dart';
import 'package:vintage_vision/presentation/widgets/list_pelicula.dart';
import 'package:vintage_vision/presentation/widgets/slider_pelicula.dart';
import 'package:vintage_vision/core/services/movie_service.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  Profile? _currentProfile;
  final AuthService _authService = AuthService();

  final MovieService _movieService = MovieService();
  List<Movie> movies = [];
  List<Movie> comedyMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEverything();
  }

  Map<String, List<Movie>> genreMovies = {};

  Future<void> _loadEverything() async {
    try {
      final profile = await _authService.getCurrentProfile();
      final allMovies = await _movieService.fetchAllMoviesPaginated();

      final genres = ['Comedia', 'Acción', 'Drama', 'Animacion', 'Romance'];

      for (String genre in genres) {
        final moviesByGenre = await _movieService.fetchMoviesByGenre(genre);
        genreMovies[genre] = moviesByGenre;
      }

      setState(() {
        _currentProfile = profile;
        movies = allMovies;
        isLoading = false;
      });
    } catch (e) {
      print('Error cargando datos: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50.0),
        child: CustomAppBar(profileName: _currentProfile?.name ?? 'Perfil'),
      ),
      endDrawer: CustomDrawer(),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 10.0,
                  ),
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

                      for (var entry in genreMovies.entries)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${entry.key}:',
                              style: TextStyle(
                                color: AppColors.vintageCream,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Limelight',
                              ),
                            ),
                            SizedBox(height: 5.0),
                            SizedBox(
                              height: 330.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: entry.value.length,
                                itemBuilder: (context, index) {
                                  return listPelicula(
                                    context,
                                    entry.value[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
    );
  }
}