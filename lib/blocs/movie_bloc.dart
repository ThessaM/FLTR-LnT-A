

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/models/movie.dart';

abstract class MovieEvent{}
class LoadMovie extends MovieEvent {
  final String userId;
  LoadMovie(this.userId);
}
class AddMovie extends MovieEvent{
  final Movie movie;
  final String userId;
  AddMovie(this.movie, this.userId);
}

class DeleteMovie extends MovieEvent{
  final String movieId;
  final String userId;
  DeleteMovie(this.movieId, this.userId);
}

class ToggleFavorite extends MovieEvent{
  final String userId;
  final Movie movie;
  ToggleFavorite(this.userId, this.movie);
}


abstract class MovieState {}
class MovieInitial extends MovieState {}
class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final List<String> favorites;
  MovieLoaded(this.movies, this.favorites);
}


class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  MovieBloc() : super(MovieInitial()) {

    on<LoadMovie> ((event, emit) async {
      //get latest data
      var movieDocs = await firestore.collection('movies').get();
      var favoriteMovieDocs = await firestore.collection('users').doc(event.userId).collection('favorites').get();

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();
      var favorites = favoriteMovieDocs.docs.map((e) => e.id,).toList();

      emit(MovieLoaded(movies, favorites));
    },);

    // add data
    on<AddMovie> ((event, emit) async {
      var doc = await firestore.collection('movies').add({
        'title' : event.movie.title,
        'image' : event.movie.image,
        'rating' : event.movie.rating,
        'description' : event.movie.description,
        'length' : event.movie.length
      });

      //update id
      await doc.update({'id': doc.id});

      //get latest data
      var movieDocs = await firestore.collection('movies').get();
      var favoriteMovieDocs = await firestore.collection('users').doc(event.userId).collection('favorites').get();

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();
      var favorites = favoriteMovieDocs.docs.map((e) => e.id,).toList();

      emit(MovieLoaded(movies, favorites));
    },);

    on<DeleteMovie> ((event, emit) async{
      await firestore.collection('movies').doc(event.movieId).delete();

      //get latest data
      var movieDocs = await firestore.collection('movies').get();
      var favoriteMovieDocs = await firestore.collection('users').doc(event.userId).collection('favorites').get();

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();
      var favorites = favoriteMovieDocs.docs.map((e) => e.id,).toList();

      emit(MovieLoaded(movies, favorites));
    },);

    on<ToggleFavorite>((event, emit) async {
      if (state is MovieLoaded) {
        var current = state as MovieLoaded;
        var favs = List<String>.from(current.favorites);

        var docs = firestore.collection('users').doc(event.userId).collection('favorites').doc(event.movie.id);

        if(favs.contains(event.movie.id)) {
          favs.remove(event.movie.id);
          await docs.delete();
        } else {
          favs.add(event.movie.id);
          await docs.set({'movieId' : event.movie.id});
        }

        emit(MovieLoaded(current.movies, favs));
      }
    },);
  }

}