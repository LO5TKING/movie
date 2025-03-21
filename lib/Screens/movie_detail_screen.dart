import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.primaryTitle,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.primaryImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and Year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '${movie.averageRating}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Release Year: ${movie.startYear}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    movie.description,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),

                  InfoRow(title: 'Runtime', value: '${movie.runtimeMinutes} minutes'),
                  InfoRow(title: 'Content Rating', value: movie.contentRating),
                  InfoRow(
                    title: 'Genres',
                    value: movie.genres.join(', '),
                  ),
                  InfoRow(
                    title: 'Is Adult',
                    value: movie.isAdult.toString(),
                  ),
                  InfoRow(
                    title: 'Public Votes',
                    value: movie.numVotes.toString(),
                  ),
                  InfoRow(
                    title: 'Languages',
                    value: movie.spokenLanguages.join(', '),
                  ),

                  if (movie.filmingLocations.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text(
                      'Filming Locations',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.filmingLocations.join('\n'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],

                  if (movie.interests.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text(
                      'Interest',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.interests.join('\n'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],


                  SizedBox(height: 20),
                  Text(
                    'Box Office',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  InfoRow(
                    title: 'Budget',
                    value: '\$${movie.budget.toStringAsFixed(2)}',
                  ),
                  InfoRow(
                    title: 'Worldwide Gross',
                    value: '\$${movie.grossWorldwide.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 230,
            child: Text(
              "${title}:-",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}