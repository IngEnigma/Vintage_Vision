// ignore_for_file: avoid_print, unused_import
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vintage_vision/core/models/movie_model.dart';

class MovieService {
  final String baseUrl =
      "https://vintage-vision-api-re7s.onrender.com/api/movies";

  static const String cloudName = 'duaxfjdp6';
  static const String uploadPreset = 'flutter_upload';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt');
  }

  Future<List<Movie>> fetchAllMoviesPaginated({int limit = 10}) async {
    List<Movie> allMovies = [];
    int offset = 0;

    while (true) {
      final result = await fetchMovies(limit: limit, offset: offset);
      if (result.isEmpty) break;
      allMovies.addAll(result);
      if (result.length < limit) break;
      offset += limit;
    }

    return allMovies;
  }

  Future<List<Movie>> fetchMovies({int limit = 10, int offset = 0}) async {
    final token = await _getToken();
    if (token == null) throw Exception("Token no encontrado");

    final url = Uri.parse('$baseUrl?limit=$limit&offset=$offset');
    final response = await http.get(
      url,
      headers: {'accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Error cargando películas: ${response.statusCode}');
    }
  }

  Future<List<Movie>> fetchMoviesByGenre(
    String genre, {
    int limit = 10,
    int offset = 0,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception("Token no encontrado");

    // Codificar el género para URL y construir la URL con parámetros
    final encodedGenre = Uri.encodeComponent(genre);
    final url = Uri.parse(
      '$baseUrl?genre=$encodedGenre&limit=$limit&offset=$offset',
    );

    final response = await http.get(
      url,
      headers: {'accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Movie.fromJson(e)).toList();
    } else {
      final errorBody = jsonDecode(response.body);
      throw Exception(
        'Error al cargar películas por género: ${errorBody['message'] ?? response.statusCode}',
      );
    }
  }

  /// Subida de imagen a Cloudinary
  Future<String?> uploadImageToCloudinary({PlatformFile? file}) async {
    FilePickerResult? result =
        file == null
            ? await FilePicker.platform.pickFiles(
              type: FileType.image,
              allowMultiple: false,
              withData: true,
            )
            : null;

    final selectedFile = file ?? result?.files.first;
    if (selectedFile == null || selectedFile.bytes == null) return null;

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request =
        http.MultipartRequest('POST', url)
          ..fields['upload_preset'] = uploadPreset
          ..files.add(
            http.MultipartFile.fromBytes(
              'file',
              selectedFile.bytes!,
              filename: selectedFile.name,
            ),
          );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);
      return jsonResponse['secure_url'];
    } else {
      print(await response.stream.bytesToString());
      throw Exception('Error al subir imagen: ${response.statusCode}');
    }
  }

  /// Subida de video a Cloudinary
  Future<String?> uploadVideoToCloudinary({PlatformFile? file}) async {
    FilePickerResult? result =
        file == null
            ? await FilePicker.platform.pickFiles(
              type: FileType.video,
              allowMultiple: false,
              withData: true, // importante para que funcione en Web
            )
            : null;

    final selectedFile = file ?? result?.files.first;
    if (selectedFile == null) return null;

    final dio = Dio();
    FormData formData;

    if (selectedFile.bytes != null) {
      // Para Web
      formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          selectedFile.bytes!,
          filename: selectedFile.name,
          contentType: MediaType("video", "mp4"), // usa el tipo correcto
        ),
        'upload_preset': uploadPreset,
      });
    } else if (selectedFile.path != null) {
      // Para Android/iOS/Escritorio
      formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          selectedFile.path!,
          filename: selectedFile.name,
        ),
        'upload_preset': uploadPreset,
      });
    } else {
      throw Exception("No se pudo procesar el archivo seleccionado.");
    }

    try {
      final response = await dio.post(
        'https://api.cloudinary.com/v1_1/$cloudName/video/upload',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      return response.data['secure_url'];
    } catch (e) {
      print('Error subiendo video: $e');
      return null;
    }
  }

  /// Crear película usando URLs ya subidas a Cloudinary
  Future<bool> createMovieWithUrls({
    required String title,
    required String description,
    required int year,
    required String genre,
    required int duration,
    required String imageUrl,
    required String videoUrl,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception("Token no encontrado");

    final url = Uri.parse(
      "https://vintage-vision-api-re7s.onrender.com/api/admin/movies",
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'title': title,
        'description': description,
        'year': year,
        'genre': genre,
        'duration': duration,
        'image_url': imageUrl,
        'stream_url': videoUrl,
      }),
    );

    if (response.statusCode == 201) {
      print("Película creada correctamente");
      return true;
    } else {
      print("Error al crear película: ${response.body}");
      return false;
    }
  }

  /// Actualiza una película existente
  Future<Map<String, bool>> updateMovie({
    required int id,
    required String title,
    required String description,
    required int year,
    required String genre,
    required int duration,
    required String imageUrl,
    required String streamUrl,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception("Token no encontrado");

    final url = Uri.parse(
      "https://vintage-vision-api-re7s.onrender.com/api/admin/movies/$id",
    );

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'title': title,
        'description': description,
        'year': year,
        'genre': genre,
        'duration': duration,
        'image_url': imageUrl,
        'stream_url': streamUrl,
      }),
    );

    if (response.statusCode == 200) {
      print("Película actualizada correctamente");
      return {'success': true};
    } else {
      print("Error al actualizar película: ${response.body}");
      return {'success': false};
    }
  }

  /// Elimina una película existente
  Future<Map<String, bool>> deleteMovie(int id) async {
    final token = await _getToken();
    if (token == null) throw Exception("Token no encontrado");

    final url = Uri.parse(
      "https://vintage-vision-api-re7s.onrender.com/api/admin/movies/$id",
    );

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print("Película eliminada correctamente");
      return {'success': true};
    } else {
      print("Error al eliminar película: ${response.body}");
      return {'success': false};
    }
  }
}
