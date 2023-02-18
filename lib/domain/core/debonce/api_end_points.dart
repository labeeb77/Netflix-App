import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/core/costurl/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const searchlink = '$kBaseUrl/search/movie?api_key=$apiKey';
  static const everyoneseenmovie = '$kBaseUrl/movie/popular?api_key=$apiKey';
  static const tensedrrama = '$kBaseUrl/movie/latest?api_key=$apiKey';
  static const soutindianmovie = '$kBaseUrl/3/person/popular?api_key=$apiKey';
  static const upcomingmovie = '$kBaseUrl/movie/upcoming?api_key=$apiKey';
  static const top10showindia = '$kBaseUrl/movie/now_playing?api_key=$apiKey';
  static const homeMainimage = '$kBaseUrl/movie/now_playing?api_key=$apiKey';
}
