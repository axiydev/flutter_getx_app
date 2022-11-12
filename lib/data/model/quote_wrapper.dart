import 'package:flutter_getx_app/data/model/quote_model.dart';

class QuoteWrapper {
  final List<Quote?>? quotes;
  final int? total;
  final int? skip;
  final int? limit;
  QuoteWrapper(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.quotes});
  factory QuoteWrapper.fromJson(Map<String, dynamic> json) => QuoteWrapper(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      quotes: List.from(json['quotes'].map((e) => Quote.fromJson(e))));

  QuoteWrapper copyWith(
          {int? total, int? skip, int? limit, List<Quote?>? quotes}) =>
      QuoteWrapper(
          total: total ?? this.total,
          skip: skip ?? this.skip,
          limit: limit ?? this.limit,
          quotes: quotes ?? this.quotes);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    map['quotes'] = List.from(quotes!.map((e) => e!.toJson()));
    return map;
  }
}
