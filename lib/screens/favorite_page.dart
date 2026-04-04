import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/screens/movie_detail_page.dart';

class FavoritePage extends StatelessWidget {
  final String userId;
  FavoritePage(this.userId);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        var movie = null;

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
}