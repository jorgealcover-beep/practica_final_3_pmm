import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  // const MovieSlider({Key? key}) : super(key: key);

  final List<Book> books;
  const MovieSlider({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    if (this.books.length == 0) {
      return Container(
        width: double.infinity,
        height: 274,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 274,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, int index) => _MoviePoster(books: books, index: index)),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key, required this.books, required this.index}) : super(key: key);
  final List<Book> books;
  final int index;
  @override
  Widget build(BuildContext context) {
    final book = books[index]; // Aquí pots canviar l'índex per mostrar diferents llibres de la llista
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      
      child: Column(
        
        children: [
          
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: book),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(book.coverImage),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
