import 'package:flutter/cupertino.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/models.dart';

class BooksProvider extends ChangeNotifier {
  final String _baseUrl = 'api.nytimes.com';
  final String _apiKey = 'HaGxoppXS8i0hA6Qg2f236ztiwZUzEaRx2utkcpdRzNxiJ2h';

  List<Book> onDisplayBooks = [];
  List<Book> onPopularBooks = [];

  BooksProvider(){
    print('BooksProvider inicializado');
    this.getOnDisplayBooks();
  }

  getOnDisplayBooks() async {
    print('getOnDisplayBooks');
    
    var url = Uri.https(_baseUrl, '/svc/books/v3/lists/overview.json', {
      'api-key': _apiKey,
      });
    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);
    
    onDisplayBooks = nowPlayingResponse.results.getLists().expand((list) => list.getBooks()).toList();

    notifyListeners();
  } 

  getOnPopularBooks() async {
    print('getOnPopularBooks');
    var url = Uri.https(_baseUrl, '/svc/books/v3/lists/overview.json', {
      'api-key': _apiKey,
    });

    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onPopularBooks = nowPlayingResponse.results.lists[1].getBooks();
    notifyListeners();
  }
}