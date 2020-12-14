import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes/data/model/quote.dart';

class FirebaseDataProvider {
  QueryDocumentSnapshot _lastDocument;
  CollectionReference quotesRef;
  FirebaseApp _firebaseApp;

  Future<List<Quote>> getQuotes() async {
    List<Quote> quotes = List();
    await _initFirebaseApp();
    quotesRef = FirebaseFirestore.instance.collection('quotes');
    var myQuery = quotesRef.limit(4);
    var res = await myQuery.get();
    res.docs.forEach((element) {
      quotes.add(Quote.fromDataSnapshot(element.data()));
    });
    _lastDocument = res.docs[res.docs.length - 1];
    return quotes;
  }

  Future<List<Quote>> getNextQuotes(String category) async {
    List<Quote> quotes = List();
    await _initFirebaseApp();
    var myQuery =
        quotesRef.where("categories", arrayContains: category.toLowerCase()).limit(4).startAfterDocument(_lastDocument);
    var res = await myQuery.get();
    res.docs.forEach((element) {
      quotes.add(Quote.fromDataSnapshot(element.data()));
    });
    if (res.docs.length > 0) {
      _lastDocument = res.docs[res.docs.length - 1];
    }
    return quotes;
  }

  Future<List<Quote>> getQuotesFromCategory(String category) async {
    List<Quote> quotes = List();
    await _initFirebaseApp();
    quotesRef = FirebaseFirestore.instance.collection('quotes');
    var myQuery = quotesRef.where("categories", arrayContains: category.toLowerCase()).limit(4);
    var res = await myQuery.get();
    if (res.docs.isNotEmpty) {
      res.docs.forEach((element) {
        quotes.add(Quote.fromDataSnapshot(element.data()));
      });
      _lastDocument = res.docs[res.docs.length - 1];
      return quotes;
    } else {
      return List.empty();
    }
  }

  Future _initFirebaseApp() async {
    if (_firebaseApp == null) {
      _firebaseApp = await Firebase.initializeApp();
    }
  }
}
