import 'models.dart';

class NowPlayingResponse {
    final String next;
    final dynamic previous;
    final List<Book> results;

    NowPlayingResponse({
        required this.next,
        required this.previous,
        required this.results,
    });

    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        next: json["next"],
        previous: json["previous"],
        results: List<Book>.from(json["results"].map((x) => Book.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

