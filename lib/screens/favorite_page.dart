import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/blocs/movie_bloc.dart';
import 'package:main_fltr_lnt_a/screens/movie_detail_page.dart';

class FavoritePage extends StatelessWidget {
  final String userId;
  FavoritePage(this.userId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: 
    (context, state) {
      if(state is MovieLoaded){
        var favoriteMovies = state.movies.where((m) => state.favorites.contains(m.id)).toList();

        return ListView.builder(
          itemCount: favoriteMovies.length,
          itemBuilder: (context, index) {
            var movie = favoriteMovies[index];

            return Card(
              color: Colors.grey[900],
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: .all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      movie.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(movie.title, style: TextStyle(color: Colors.white),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailPage(movie, true, userId),
                    ),
                  );
                },
              ),
            );
          },
        );
      }
      return Center(child: Text("No Favorites"),);
    },);
  }
}