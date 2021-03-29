import 'dart:convert';

import 'package:flutter_provider_practice/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  var queryPram = {
    "api_key": "9b4c67fde0a4356416c7eb69a5713b11",
  };
  Future<List<Movie>> loadMovied() async {
    var url = Uri.https("api.themoviedb.org", "/3/movie/popular", queryPram);
    var response = await http.get(url);
    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body["results"] != null) {
        List<dynamic> list = body["results"];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
        //list를 새로 만드는데 Movie객체를 리스트화해서 만들어 근데 가져온 정보중 필요한 것만 골라서 .
      }
    }
  }
} //http의 json데이터를 Map<String, dynamic>의 형식으로 가져옴
