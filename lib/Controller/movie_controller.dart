import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../Model/movie_model.dart';
import '../APi Service/api_service.dart';
import 'package:hive/hive.dart';

class MovieController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<MovieModel> movies = <MovieModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        final apiMovies = await _apiService.fetchMovies();
        movies.value = apiMovies;
        final box = await Hive.openBox<MovieModel>('movies');
        await box.clear();
        await box.addAll(apiMovies);
      } else {

        final box = await Hive.openBox<MovieModel>('movies');
        movies.value = box.values.toList();
      }
    } catch (e) {
      print('Error: $e');
      final box = await Hive.openBox<MovieModel>('movies');
      movies.value = box.values.toList();
    } finally {
      isLoading.value = false;
    }
  }
}