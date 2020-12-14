import 'package:quotes/data/data_provider/firebase_data_provider.dart';
import 'package:quotes/data/model/quote.dart';

class QuotesRepository {
  FirebaseDataProvider _firebaseDataProvider = FirebaseDataProvider();
  Future<List<Quote>> getQuotes() async {
    var quotes = await _firebaseDataProvider.getQuotes();
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
