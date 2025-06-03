// ignore_for_file: use_build_context_synchronously, unused_import
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/core/services/movie_service.dart';
import 'package:vintage_vision/presentation/widgets/button_red_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_textarea_widget.dart';
import 'package:vintage_vision/routes/routes.dart';

class EditMovieScreen extends StatefulWidget {
  const EditMovieScreen({super.key});

  @override
  State<EditMovieScreen> createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  bool isLoading = false;

  FilePickerResult? _imageResult;
  FilePickerResult? _videoResult;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if (result != null) {
      setState(() {
        _imageResult = result;
      });
    }
  }

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      withData: true,
    );
    if (result != null) {
      setState(() {
        _videoResult = result;
      });
    }
  }

  void resetForm() {
    _titleController.clear();
    _yearController.clear();
    _genreController.clear();
    _descriptionController.clear();
    _durationController.clear();
    setState(() {
      _imageResult = null;
      _videoResult = null;
    });
  }

  Future<void> submitMovie() async {
    if (_imageResult == null || _videoResult == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Falta seleccionar imagen o video")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final imageFile = _imageResult!.files.single;
      final videoFile = _videoResult!.files.single;

      final movieService = MovieService();

      // Subir imagen a Cloudinary
      final imageUrl = await movieService.uploadImageToCloudinary(file: imageFile);
      if (imageUrl == null) throw Exception("No se pudo subir la imagen");

      // Subir video a Cloudinary
      final videoUrl = await movieService.uploadVideoToCloudinary(file: videoFile);
      if (videoUrl == null) throw Exception("No se pudo subir el video");

      // Crear película con URLs
      final success = await movieService.createMovieWithUrls(
        title: _titleController.text,
        description: _descriptionController.text,
        year: int.tryParse(_yearController.text) ?? 0,
        genre: _genreController.text,
        duration: int.tryParse(_durationController.text) ?? 0,
        imageUrl: imageUrl,
        videoUrl: videoUrl,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("🎉 Película creada exitosamente")),
        );
        resetForm();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Error al crear película")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error inesperado: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        toolbarHeight: 100,
        titleSpacing: 32,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.vintageCream),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.confiperfil,
              (route) => false,
            );
          },
        ),
        title: const Text(
          'Editar Película',
          style: TextStyle(
            color: AppColors.vintageCream,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Limelight',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputWidget(
              controller: _titleController,
              obscureText: false,
              hintText: 'Título',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 155.0,
                  child: CustomInputWidget(
                    controller: _yearController,
                    obscureText: false,
                    hintText: 'Año',
                  ),
                ),
                SizedBox(
                  width: 155.0,
                  child: CustomInputWidget(
                    controller: _genreController,
                    obscureText: false,
                    hintText: 'Género',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextAreaWidget(
              controller: _descriptionController,
              hintText: 'Sinopsis',
            ),
            const SizedBox(height: 16),
            CustomInputWidget(
              controller: _durationController,
              obscureText: false,
              hintText: 'Duración (minutos)',
            ),
            const SizedBox(height: 16),
            ButtonRedWidget(
              text: _imageResult == null
                  ? 'Seleccionar imagen'
                  : '✅ Imagen cargada: ${_imageResult!.files.single.name}',
              onPressed: pickImage,
            ),
            const SizedBox(height: 10),
            ButtonRedWidget(
              text: _videoResult == null
                  ? 'Seleccionar video'
                  : '✅ Video cargado: ${_videoResult!.files.single.name}',
              onPressed: pickVideo,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator(color: AppColors.vintageCream)
                : ButtonRedWidget(
                    text: 'Crear',
                    onPressed: submitMovie,
                  ),
            const SizedBox(height: 20),
            ButtonRedWidget(
                    text: 'eliminar',
                    onPressed: submitMovie,
                  ),
          ],
        ),
      ),
    );
  }
}