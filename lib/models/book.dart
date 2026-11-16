import 'models.dart';

class Book {
    final int id;
    final String title;
    final String? alternativeTitle;
    final List<Author> authors;
    final List<String> subjects;
    final List<String> bookshelves;
    final Formats formats;
    final int downloadCount;
    final DateTime issued;
    final String summary;
    final String? readingEaseScore;
    final String coverImage;
    final dynamic removedFromCatalog;

    Book({
        required this.id,
        required this.title,
        required this.alternativeTitle,
        required this.authors,
        required this.subjects,
        required this.bookshelves,
        required this.formats,
        required this.downloadCount,
        required this.issued,
        required this.summary,
        required this.readingEaseScore,
        required this.coverImage,
        required this.removedFromCatalog,
    });

    

    factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        alternativeTitle: json["alternative_title"],
        authors: List<Author>.from(json["authors"].map((x) => Author.fromMap(x))),
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        formats: Formats.fromMap(json["formats"]),
        downloadCount: json["download_count"],
        issued: DateTime.parse(json["issued"]),
        summary: json["summary"],
        readingEaseScore: json["reading_ease_score"],
        coverImage: json["cover_image"],
        removedFromCatalog: json["removed_from_catalog"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alternative_title": alternativeTitle,
        "authors": List<dynamic>.from(authors.map((x) => x.toMap())),
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
        "formats": formats.toMap(),
        "download_count": downloadCount,
        "issued": issued.toIso8601String(),
        "summary": summary,
        "reading_ease_score": readingEaseScore,
        "cover_image": coverImage,
        "removed_from_catalog": removedFromCatalog,
    };
}

class Author {
    final int id;
    final String name;

    Author({
        required this.id,
        required this.name,
    });

    factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Author.fromMap(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}

class Formats {
    final String? textPlainCharsetUsAscii;
    final String? textPlain;
    final String? textHtmlCharsetUtf8;
    final String textHtml;
    final String applicationEpubZip;
    final String applicationXMobipocketEbook;
    final String textPlainCharsetUtf8;
    final String applicationRdfXml;
    final String imageJpeg;
    final String applicationOctetStream;
    final String applicationZip;
    final String? textPlainCharsetIso88591;

    Formats({
        this.textPlainCharsetUsAscii,
        this.textPlain,
        this.textHtmlCharsetUtf8,
        required this.textHtml,
        required this.applicationEpubZip,
        required this.applicationXMobipocketEbook,
        required this.textPlainCharsetUtf8,
        required this.applicationRdfXml,
        required this.imageJpeg,
        required this.applicationOctetStream,
        required this.applicationZip,
        this.textPlainCharsetIso88591,
    });

    factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
        textPlain: json["text/plain"],
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
        textHtml: json["text/html"],
        applicationEpubZip: json["application/epub+zip"],
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
        applicationRdfXml: json["application/rdf+xml"],
        imageJpeg: json["image/jpeg"],
        applicationOctetStream: json["application/octet-stream"],
        applicationZip: json["application/zip"],
        textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
    );

    Map<String, dynamic> toMap() => {
        "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
        "text/plain": textPlain,
        "text/html; charset=utf-8": textHtmlCharsetUtf8,
        "text/html": textHtml,
        "application/epub+zip": applicationEpubZip,
        "application/x-mobipocket-ebook": applicationXMobipocketEbook,
        "text/plain; charset=utf-8": textPlainCharsetUtf8,
        "application/rdf+xml": applicationRdfXml,
        "image/jpeg": imageJpeg,
        "application/octet-stream": applicationOctetStream,
        "application/zip": applicationZip,
        "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
    };
}
