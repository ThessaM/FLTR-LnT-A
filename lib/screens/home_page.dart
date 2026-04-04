
import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/screens/favorite_page.dart';
import 'package:main_fltr_lnt_a/screens/movie_detail_page.dart';

class HomePage extends StatefulWidget {
  final String userId;
  HomePage(this.userId);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(index == 0 ? 'Movies' : 'Favorites'),
      ),
      body: index == 0 ? buildMovies() : FavoritePage(widget.userId),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }

  Widget buildMovies() {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, i) {
        var m = null;
        var isFav = false;

        return Card(
          color: Colors.grey[900],
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  m.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(m.title, style: TextStyle(color: Colors.white),),
            subtitle: Text('⭐ ${m.rating} | ${m.length} min', style: TextStyle(color: Colors.grey),),
            trailing: IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              onPressed: () {
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(m, isFav, widget.userId),
                ),
              );
            },
          ),
        );
      },
    );
  }
}