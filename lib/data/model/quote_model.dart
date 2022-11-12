class Quote {
  final int? id;
  final String? author;
  final String? quote;
  Quote({required this.author, required this.id, required this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json['id'],
        author: json['author'],
        quote: json['quote'],
      );
  Quote copyWith({int? id, String? author, String? quote}) => Quote(
      author: author ?? this.author,
      id: id ?? this.id,
      quote: quote ?? this.quote);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['author'] = author;
    map['quote'] = quote;
    return map;
  }
}
