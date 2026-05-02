

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/blocs/movie_bloc.dart';
import 'package:main_fltr_lnt_a/models/movie.dart';

class AddMoviePage extends StatelessWidget{

  final String userId;
  AddMoviePage(this.userId);

  final title = TextEditingController();
  final image = TextEditingController();
  final rating = TextEditingController();
  final description = TextEditingController();
  final length = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Movie"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: title, style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: image, style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Image'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: rating, style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Rating'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: length, style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Length'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: description, style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {
              if(title.text.isEmpty || image.text.isEmpty || rating.text.isEmpty || length.text.isEmpty || description.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("All Fields must be filled"), backgroundColor: Colors.red,)
                );
                return;
              }

              try{

                var movie = Movie(id: "id", title: title.text, image: image.text, rating: double.parse(rating.text), description: description.text, length: int.parse(length.text));
                context.read<MovieBloc>().add(AddMovie(movie, userId));
                Navigator.pop(context);

              }catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString()), backgroundColor: Colors.red,)
                );
              }

            }, child: Text('Add Movie'))
          ],
        ) 
      ),
    );
  }
}