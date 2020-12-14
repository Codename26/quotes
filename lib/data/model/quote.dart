import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Quote extends Equatable {
  String id;
  String text;
  String author;
  bool isFavorite;
  String imgURL;
  String tag;

  Quote(
      {@required this.id,
      @required this.text,
      @required this.author,
      @required this.isFavorite,
      @required this.imgURL,
      @required this.tag});

  Quote.fromDataSnapshot(Map data) {
    this.author = data['author'];
    this.text = data['text'];
  }

  @override
  List<Object> get props => [id, text, author, tag];

  @override
  String toString() => "Quote: ($id  $text)";
}
