// To parse this JSON data, do
//
//     final quoteApi = quoteApiFromJson(jsonString);

import 'dart:convert';

QuoteApi quoteApiFromJson(String str) => QuoteApi.fromJson(json.decode(str));

String quoteApiToJson(QuoteApi data) => json.encode(data.toJson());

class QuoteApi {
    final String? id;
    final String? author;
    final String? content;
    final List<String>? tags;
    final String? authorSlug;
    final int? length;
    final DateTime? dateAdded;
    final DateTime? dateModified;

    QuoteApi({
        this.id,
        this.author,
        this.content,
        this.tags,
        this.authorSlug,
        this.length,
        this.dateAdded,
        this.dateModified,
    });

    QuoteApi copyWith({
        String? id,
        String? author,
        String? content,
        List<String>? tags,
        String? authorSlug,
        int? length,
        DateTime? dateAdded,
        DateTime? dateModified,
    }) => 
        QuoteApi(
            id: id ?? this.id,
            author: author ?? this.author,
            content: content ?? this.content,
            tags: tags ?? this.tags,
            authorSlug: authorSlug ?? this.authorSlug,
            length: length ?? this.length,
            dateAdded: dateAdded ?? this.dateAdded,
            dateModified: dateModified ?? this.dateModified,
        );

    factory QuoteApi.fromJson(Map<String, dynamic> json) => QuoteApi(
        id: json["_id"],
        author: json["author"],
        content: json["content"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: json["dateAdded"] == null ? null : DateTime.parse(json["dateAdded"]),
        dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "content": content,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded": "${dateAdded!.year.toString().padLeft(4, '0')}-${dateAdded!.month.toString().padLeft(2, '0')}-${dateAdded!.day.toString().padLeft(2, '0')}",
        "dateModified": "${dateModified!.year.toString().padLeft(4, '0')}-${dateModified!.month.toString().padLeft(2, '0')}-${dateModified!.day.toString().padLeft(2, '0')}",
    };
}
