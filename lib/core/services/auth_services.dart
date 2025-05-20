//Api
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/profile_model.dart';

class AuthService {
  final String baseUrl = 'https://vintage-vision-api-re7s.onrender.com/api';

  Future<User?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    // ignore: avoid_print
    print('Iniciando login para $email');

    try {
      // 1. Realizar login para obtener token
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      // ignore: avoid_print
      print('Respuesta login: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        
        if (token == null || token.isEmpty) {
          // ignore: avoid_print
          print('Error: Token vacío o nulo');
          return null;
        }

        // Guardar token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt', token);
        // ignore: avoid_print
        print('Token guardado: $token');

        // 2. Crear usuario básico con la información que tenemos
        final user = User(
          id: 'temp_id', // Temporal, lo actualizaremos después
          email: email,
          username: email.split('@')[0],
          isAdmin: false,
          profiles: [], // Inicialmente vacío
        );

        return user;

      } else {
        // ignore: avoid_print
        print('Error en login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Excepción en login: $e');
      return null;
    }
  }

  Future<User?> createUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    // ignore: avoid_print
    print('Registrando nuevo usuario: $email');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode({'email': email, 'password': password}),
      );

      // ignore: avoid_print
      print('Respuesta registro: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Asumiendo que el registro solo devuelve éxito pero no datos
        return User(
          id: 'temp_id',
          email: email,
          username: email.split('@')[0],
          isAdmin: false,
          profiles: [],
        );
      } else {
        // ignore: avoid_print
        print('Error en registro: ${response.body}');
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Excepción en registro: $e');
      return null;
    }
  }

  /*Future<List<Profile>?> getUserProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    
    if (token == null) {
      // ignore: avoid_print
      print('No hay token almacenado');
      return null;
    }

    final url = Uri.parse('$baseUrl/profiles');
    // ignore: avoid_print
    print('Obteniendo perfiles con token: $token');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      // ignore: avoid_print
      print('Respuesta perfiles: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        if (data == null) {
          // ignore: avoid_print
          print('La API devolvió perfiles nulos');
          return [];
        }

        if (data is List) {
          return data.map<Profile>((p) => Profile(
            id: p['id']?.toString() ?? '0',
            name: p['name'] ?? 'Perfil sin nombre',
            avatarUrl: p['avatar_url'] ?? 'assets/images/user_icon.png',
          )).toList();
        } else {
          // ignore: avoid_print
          print('Formato de perfiles inválido');
          return [];
        }
      } else {
        // ignore: avoid_print
        print('Error al obtener perfiles: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Excepción al obtener perfiles: $e');
      return null;
    }
  }*/

  Future<List<Profile>?> getUserProfiles() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('jwt');
  
  if (token == null) {
    // ignore: avoid_print
    print('No hay token almacenado');
    return null;
  }

  final url = Uri.parse('$baseUrl/profiles');
  // ignore: avoid_print
  print('Obteniendo perfiles con token: $token');

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
// ignore: avoid_print
    print('Respuesta perfiles: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      
      if (data == null) {
        // ignore: avoid_print
        print('La API devolvió perfiles nulos');
        return [];
      }

      if (data is List) {
        return data.map<Profile>((p) => Profile.fromJson(p)).toList();
      } else {
        // ignore: avoid_print
        print('Formato de perfiles inválido');
        return [];
      }
    } else {
      // ignore: avoid_print
      print('Error al obtener perfiles: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // ignore: avoid_print
    print('Excepción al obtener perfiles: $e');
    return null;
  }
}

  Future<bool> createProfile(String name, String avatarUrl, bool isChildMode) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    if (token == null){
      // ignore: avoid_print
      print('Error: No hay token almacenado');
      return false;
    }

    final url = Uri.parse('$baseUrl/profiles');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'name': name,
          'avatar_url': avatarUrl,
        }),
      );

      // ignore: avoid_print
      print('Respuesta creación perfil: ${response.statusCode} - ${response.body}');

      if(response.statusCode == 201){
        return true;
      } else {
        //ignore: avoid_print
        print('Error al crear perfil: ${response.body}');
        return false;
      }
    }catch(e){
      //ignore: avoid_print
      print('Excepción al crear perfil: $e');
      return false;
    }
  }
}