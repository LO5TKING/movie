import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie/Controller/movie_controller.dart';
import 'package:movie/Model/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://imdb236.p.rapidapi.com/imdb/top250-movies';
  static const Map<String, String> headers = {
    'x-rapidapi-key': 'b1924f3d89msh2e7bd34d21322c5p1b2ab3jsn466e8636b7dd',
    'x-rapidapi-host': 'imdb236.p.rapidapi.com',
  };

  Future<List<MovieModel>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => MovieModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load movies');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}