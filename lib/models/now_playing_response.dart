import 'models.dart';

import 'dart:convert';

class NowPlayingResponse {
    final String status;
    final String copyright;
    final int numResults;
    final Results results;

    NowPlayingResponse({
        required this.status,
        required this.copyright,
        required this.numResults,
        required this.results,
    });

    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: Results.fromMap(json["results"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": results.toMap(),
    };
}

