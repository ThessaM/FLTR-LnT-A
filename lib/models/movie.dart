class Movie {
  String id;
  String title;
  String image;
  double rating;
  String description;
  int length; // minutes

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
    required this.length,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'rating': rating,
      'description': description,
      'length': length,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      rating: (map['rating'] as num).toDouble(),
      description: map['description'],
      length: map['length'],
    );
  }
}