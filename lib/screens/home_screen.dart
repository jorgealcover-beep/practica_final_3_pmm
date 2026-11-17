import 'package:flutter/material.dart';
import 'package:movies_app/providers/books_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Sellers'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(books: booksProvider.onDisplayBooks),

              // Slider de pel·licules
              BookSlider(books: booksProvider.onDisplayBooks),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
