import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book llibre = ModalRoute.of(context)?.settings.arguments as Book;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(book : llibre),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(book: llibre),
                _Overview(book : llibre),
                CastingCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Book book;

  const _CustomAppBar({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            book.title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(book.coverImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Book book;

  const _PosterAndTitle({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(book.coverImage),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                book.title,
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                book.authors.first.name,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                book.subjects.toString(),
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Book book;

  const _Overview({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        book.summary,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
