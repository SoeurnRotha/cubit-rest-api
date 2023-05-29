// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'dart:convert';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes {
  List<Quote> quotes;
  int total;
  int skip;
  int limit;

  Quotes({
    required this.quotes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
    quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Quote {
  int id;
  String quote;
  String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    id: json["id"],
    quote: json["quote"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quote": quote,
    "author": author,
  };
}
