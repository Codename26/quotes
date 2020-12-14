import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes/data/model/quote.dart';

class FirebaseDataProvider {
  QueryDocumentSnapshot _lastDocument;
  CollectionReference quotesRef;

  Future<List<Quote>> getQuotes() async {
    List<Quote> quotes = List();
    await Firebase.initializeApp();
    quotesRef = FirebaseFirestore.instance.collection('quotes');
    var myQuery = quotesRef.limit(4);
    var res = await myQuery.get();
    res.docs.forEach((element) {
      quotes.add(Quote.fromDataSnapshot(element.data()));
    });
    _lastDocument = res.docs[res.docs.length - 1];
    return quotes;
  }

  Future<List<Quote>> getNextQuotes() async {
    List<Quote> quotes = List();
    var myQuery = quotesRef.startAfterDocument(_lastDocument);
    var res = await myQuery.get();
    res.docs.forEach((element) {
      quotes.add(Quote.fromDataSnapshot(element.data()));
    });
    if (res.docs.length > 0) {
      _lastDocument = res.docs[res.docs.length - 1];
    }
    return quotes;
  }
}
