import 'package:flutter/cupertino.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/models.dart';

class BooksProvider extends ChangeNotifier {
  String _baseUrl = 'project-gutenberg-free-books-api1.p.rapidapi.com';
  String _apiKey = '52842e9fa9mshf49e02a293404e5p19a19ejsnfe567928aa7a';
  String _include_removed = 'true';

  List<Book> onDisplayBooks = [];
  List<Book> onPopularBooks = [];

  BooksProvider(){
    print('BooksProvider inicializado');
    this.getOnDisplayBooks();
  }

  getOnDisplayBooks() async {
    print('getOnDisplayBooks');
    var url = Uri.https(_baseUrl, '/books', {
      'include_removed': _include_removed,
      'rapidapi-key': _apiKey,
      });

  // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayBooks = nowPlayingResponse.results;

    notifyListeners();
  } 

  getOnPopularBooks() async {
    print('getOnPopularBooks');
    var url = Uri.https(_baseUrl, '/books', {
      'include_removed': _include_removed,
      'rapidapi-key': _apiKey,
    });

    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onPopularBooks = nowPlayingResponse.results;
    notifyListeners();
  }
}