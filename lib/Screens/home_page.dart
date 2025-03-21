import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/Theme/theme_controller.dart';
import 'package:movie/Controller/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'movie_detail_screen.dart';

class HomePage extends StatelessWidget {
  final MovieController movieController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 250 Movies'),
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              themeController.isDarkMode 
                ? Icons.light_mode 
                : Icons.dark_mode,
            ),
            onPressed: themeController.toggleTheme,
          )),
        ],
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: movieController.fetchMovies,
          child: ListView.builder(
            itemCount: movieController.movies.length,
            itemBuilder: (context, index) {
              final movie = movieController.movies[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  onTap: (){
                    Get.to(() => MovieDetailScreen(movie: movie));
                  },
                  contentPadding: EdgeInsets.all(8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      width: 60,
                      height: 90,
                      child: CachedNetworkImage(
                        imageUrl: movie.primaryImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  title: Text(
                    movie.primaryTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('description: ${movie.description}',maxLines: 3,),
                  trailing: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '⭐ ${movie.averageRating}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}