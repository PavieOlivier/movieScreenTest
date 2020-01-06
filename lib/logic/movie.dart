import 'package:flutter/foundation.dart';

///this class contain the necessary
///information about a movie 
class Movie {
  Movie(
      {@required this.imageCoverUrl,
      @required this.rating,
      @required this.story,
      @required this.title});
  String title;
  String story;
  String imageCoverUrl;
  String rating;
}
