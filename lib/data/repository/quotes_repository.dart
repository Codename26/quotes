import 'package:quotes/data/data_provider/firebase_data_provider.dart';
import 'package:quotes/data/data_provider/local_data_provider.dart';
import 'package:quotes/data/model/quote.dart';

class QuotesRepository {
  FirebaseDataProvider _firebaseDataProvider = FirebaseDataProvider();
  LocalDataProvider _localDataProvider = LocalDataProvider();
  Future<List<Quote>> getQuotes(String category) async {
    List<Quote> quotes;
    if (category == null) {
      quotes = await _localDataProvider.getAllQuotes();
    } else {
      quotes = await _localDataProvider.getQuotes(category);
    }

    if (quotes.isEmpty) {
      quotes = await _firebaseDataProvider.getQuotes();
      _localDataProvider.saveQuotes(quotes);
    }
    return quotes;
  }

  Future<List<Quote>> getNextQuotes(String category) async {
    try {
      var quotes = await _firebaseDataProvider.getNextQuotes(category);
      return quotes;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Quote>> getQuotesFromCategory(String category) async {
    var quotes = await _firebaseDataProvider.getQuotesFromCategory(category);
    return quotes;
  }
}
