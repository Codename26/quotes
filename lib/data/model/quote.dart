import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Quote extends Equatable {
  String id;
  String text;
  String author;
  int isFavorite;
  String imgURL;
  String tag;

  Quote({@required this.id, @required this.text, @required this.author, @required this.isFavorite, @required this.tag});

  Quote.fromDataSnapshot(QueryDocumentSnapshot snapshot) {
    this.author = snapshot.data()['author'];
    this.text = snapshot.data()['text'];
    this.id = snapshot.id;
    this.isFavorite = snapshot.data()['favorite'] == true ? 1 : 0;
    this.tag = snapshot.data()['tag'];
  }

  Quote.fromMap(Map data, String category) {
    this.author = data['author'];
    this.text = data['text'];
    this.id = data['id'];
    this.isFavorite = data['favorite'] == true ? 1 : 0;
    this.tag = category ?? 'all';
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'text': text, 'author': author, 'favorite': isFavorite, 'tag': tag};
  }

  @override
  List<Object> get props => [id, text, author, tag];

  @override
  String toString() => "Quote: ($id  $text)";
}
