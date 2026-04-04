

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/models/movie.dart';

abstract class MovieEvent{}
class LoadMovie extends MovieEvent {}
class AddMovie extends MovieEvent{
  final Movie movie;
  AddMovie(this.movie);
}

class DeleteMovie extends MovieEvent{
  final String movieId;
  DeleteMovie(this.movieId);
}

abstract class MovieState {}
class MovieInitial extends MovieState {}
class MovieLoaded extends MovieState {
  final List<Movie> movies;
  MovieLoaded(this.movies);
}


class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  MovieBloc() : super(MovieInitial()) {

    on<LoadMovie> ((event, emit) async {
      //get latest data
      var movieDocs = await firestore.collection('movies').get();

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();

      emit(MovieLoaded(movies));
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

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();

      emit(MovieLoaded(movies));
    },);

    on<DeleteMovie> ((event, emit) async{
      await firestore.collection('movies').doc(event.movieId).delete();

      //get latest data
      var movieDocs = await firestore.collection('movies').get();

      var movies = movieDocs.docs.map((e) => Movie.fromMap(e.data())).toList();

      emit(MovieLoaded(movies));
    },);
  }

}