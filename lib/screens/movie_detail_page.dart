import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/blocs/movie_bloc.dart';
import 'package:main_fltr_lnt_a/models/movie.dart';


class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  final bool isFav;
  final String userId;

  MovieDetailPage(this.movie, this.isFav, this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: .circular(12),
                child: Image.network(
                  height: 200,
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 5),
                      Text(
                        '${movie.rating}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Text('| ${movie.length} min'),
                    ],
                  ),

                  SizedBox(height: 16),

                  Text(
                    movie.description,
                    style: TextStyle(height: 1.5),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Add to Favorites',
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(onPressed: () {
                    context.read<MovieBloc>().add(DeleteMovie(movie.id));
                  }, child: Text("Delete Movie"))
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}