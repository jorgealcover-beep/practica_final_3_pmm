import 'models.dart';

class Results {
    final DateTime previousPublishedDate;
    final DateTime publishedDate;
    final String nextPublishedDate;
    final String publishedDateDescription;
    final DateTime bestsellersDate;
    final List<ListElement> lists;
    final String monthlyUri;
    final String weeklyUri;

    Results({
        required this.previousPublishedDate,
        required this.publishedDate,
        required this.nextPublishedDate,
        required this.publishedDateDescription,
        required this.bestsellersDate,
        required this.lists,
        required this.monthlyUri,
        required this.weeklyUri,
    });
    List<ListElement> getLists() {
      return lists;
    }
    factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Results.fromMap(Map<String, dynamic> json) => Results(
        previousPublishedDate: DateTime.parse(json["previous_published_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        nextPublishedDate: json["next_published_date"],
        publishedDateDescription: json["published_date_description"],
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        lists: List<ListElement>.from(json["lists"].map((x) => ListElement.fromMap(x))),
        monthlyUri: json["monthly_uri"],
        weeklyUri: json["weekly_uri"],
    );

    Map<String, dynamic> toMap() => {
        "previous_published_date": "${previousPublishedDate.year.toString().padLeft(4, '0')}-${previousPublishedDate.month.toString().padLeft(2, '0')}-${previousPublishedDate.day.toString().padLeft(2, '0')}",
        "published_date": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "next_published_date": nextPublishedDate,
        "published_date_description": publishedDateDescription,
        "bestsellers_date": "${bestsellersDate.year.toString().padLeft(4, '0')}-${bestsellersDate.month.toString().padLeft(2, '0')}-${bestsellersDate.day.toString().padLeft(2, '0')}",
        "lists": List<dynamic>.from(lists.map((x) => x.toMap())),
        "monthly_uri": monthlyUri,
        "weekly_uri": weeklyUri,
    };
}

class ListElement {
    final String displayName;
    final String listName;
    final String listNameEncoded;
    final int normalListEndsAt;
    final Updated updated;
    final int listId;
    final String uri;
    final List<Book> books;
    final List<dynamic> corrections;

    ListElement({
        required this.displayName,
        required this.listName,
        required this.listNameEncoded,
        required this.normalListEndsAt,
        required this.updated,
        required this.listId,
        required this.uri,
        required this.books,
        required this.corrections,
    });

    List<Book> getBooks() {
      return books;
    }

    factory ListElement.fromJson(String str) => ListElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        displayName: json["display_name"],
        listName: json["list_name"],
        listNameEncoded: json["list_name_encoded"],
        normalListEndsAt: json["normal_list_ends_at"],
        updated: updatedValues.map[json["updated"]]!,
        listId: json["list_id"],
        uri: json["uri"],
        books: List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
        corrections: List<dynamic>.from(json["corrections"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "display_name": displayName,
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "normal_list_ends_at": normalListEndsAt,
        "updated": updatedValues.reverse[updated],
        "list_id": listId,
        "uri": uri,
        "books": List<dynamic>.from(books.map((x) => x.toMap())),
        "corrections": List<dynamic>.from(corrections.map((x) => x)),
    };
}


class Book {
    final String ageGroup;
    final String amazonProductUrl;
    final String articleChapterLink;
    final int asterisk;
    final String author;
    final String bookImage;
    final int bookImageHeight;
    final int bookImageWidth;
    final String bookReviewLink;
    final String bookUri;
    final String contributor;
    final String contributorNote;
    final DateTime createdDate;
    final int dagger;
    final String description;
    final String firstChapterLink;
    final String price;
    final String primaryIsbn10;
    final String primaryIsbn13;
    final String publisher;
    final int rank;
    final int rankLastWeek;
    final String sundayReviewLink;
    final String title;
    final DateTime updatedDate;
    final int weeksOnList;
    final List<Isbn> isbns;
    final List<BuyLink> buyLinks;

    Book({
        required this.ageGroup,
        required this.amazonProductUrl,
        required this.articleChapterLink,
        required this.asterisk,
        required this.author,
        required this.bookImage,
        required this.bookImageHeight,
        required this.bookImageWidth,
        required this.bookReviewLink,
        required this.bookUri,
        required this.contributor,
        required this.contributorNote,
        required this.createdDate,
        required this.dagger,
        required this.description,
        required this.firstChapterLink,
        required this.price,
        required this.primaryIsbn10,
        required this.primaryIsbn13,
        required this.publisher,
        required this.rank,
        required this.rankLastWeek,
        required this.sundayReviewLink,
        required this.title,
        required this.updatedDate,
        required this.weeksOnList,
        required this.isbns,
        required this.buyLinks,
    });

    factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Book.fromMap(Map<String, dynamic> json) => Book(
        ageGroup: json["age_group"],
        amazonProductUrl: json["amazon_product_url"],
        articleChapterLink: json["article_chapter_link"],
        asterisk: json["asterisk"],
        author: json["author"],
        bookImage: json["book_image"],
        bookImageHeight: json["book_image_height"],
        bookImageWidth: json["book_image_width"],
        bookReviewLink: json["book_review_link"],
        bookUri: json["book_uri"],
        contributor: json["contributor"],
        contributorNote: json["contributor_note"],
        createdDate: DateTime.parse(json["created_date"]),
        dagger: json["dagger"],
        description: json["description"],
        firstChapterLink: json["first_chapter_link"],
        price: json["price"],
        primaryIsbn10: json["primary_isbn10"],
        primaryIsbn13: json["primary_isbn13"],
        publisher: json["publisher"],
        rank: json["rank"],
        rankLastWeek: json["rank_last_week"],
        sundayReviewLink: json["sunday_review_link"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
        weeksOnList: json["weeks_on_list"],
        isbns: List<Isbn>.from(json["isbns"].map((x) => Isbn.fromMap(x))),
        buyLinks: List<BuyLink>.from(json["buy_links"].map((x) => BuyLink.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "age_group": ageGroup,
        "amazon_product_url": amazonProductUrl,
        "article_chapter_link": articleChapterLink,
        "asterisk": asterisk,
        "author": author,
        "book_image": bookImage,
        "book_image_height": bookImageHeight,
        "book_image_width": bookImageWidth,
        "book_review_link": bookReviewLink,
        "book_uri": bookUri,
        "contributor": contributor,
        "contributor_note": contributorNote,
        "created_date": createdDate.toIso8601String(),
        "dagger": dagger,
        "description": description,
        "first_chapter_link": firstChapterLink,
        "price": price,
        "primary_isbn10": primaryIsbn10,
        "primary_isbn13": primaryIsbn13,
        "publisher": publisher,
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "sunday_review_link": sundayReviewLink,
        "title": title,
        "updated_date": updatedDate.toIso8601String(),
        "weeks_on_list": weeksOnList,
        "isbns": List<dynamic>.from(isbns.map((x) => x.toMap())),
        "buy_links": List<dynamic>.from(buyLinks.map((x) => x.toMap())),
    };
}

class BuyLink {
    final Name name;
    final String url;

    BuyLink({
        required this.name,
        required this.url,
    });

    factory BuyLink.fromJson(String str) => BuyLink.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BuyLink.fromMap(Map<String, dynamic> json) => BuyLink(
        name: nameValues.map[json["name"]]!,
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": nameValues.reverse[name],
        "url": url,
    };
}

enum Name {
    AMAZON,
    APPLE_BOOKS,
    BARNES_AND_NOBLE,
    BARNES_NOBLE,
    BOOKSHOP_ORG,
    BOOKS_A_MILLION
}

final nameValues = EnumValues({
    "Amazon": Name.AMAZON,
    "Apple Books": Name.APPLE_BOOKS,
    "Barnes and Noble": Name.BARNES_AND_NOBLE,
    "Barnes & Noble": Name.BARNES_NOBLE,
    "Bookshop.org": Name.BOOKSHOP_ORG,
    "Books-A-Million": Name.BOOKS_A_MILLION
});

class Isbn {
    final String isbn10;
    final String isbn13;

    Isbn({
        required this.isbn10,
        required this.isbn13,
    });

    factory Isbn.fromJson(String str) => Isbn.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Isbn.fromMap(Map<String, dynamic> json) => Isbn(
        isbn10: json["isbn10"],
        isbn13: json["isbn13"],
    );

    Map<String, dynamic> toMap() => {
        "isbn10": isbn10,
        "isbn13": isbn13,
    };
}

enum Updated {
    MONTHLY,
    WEEKLY
}

final updatedValues = EnumValues({
    "MONTHLY": Updated.MONTHLY,
    "WEEKLY": Updated.WEEKLY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
