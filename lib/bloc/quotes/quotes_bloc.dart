import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/data/model/quote.dart';
import 'package:quotes/data/repository/quotes_repository.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository quotesRepository;
  QuotesBloc(this.quotesRepository) : super(QuotesInitial());

  @override
  Stream<QuotesState> mapEventToState(
    QuotesEvent event,
  ) async* {
    if (event is QuotesGetNext) {
      yield* _mapQuotesGetNextToState(event.category);
    } else if (event is QuotesGet) {
      yield* _mapQuotesGetToState(event.category);
    }
  }

  Stream<QuotesState> _mapQuotesGetNextToState(String category) async* {
    // yield QuotesLoading();
    final currentState = state;
    if (currentState is QuotesSuccess) {
      try {
        var quotes = await quotesRepository.getQuotes(category);
        print("Quotes from Firebase received");
        var allQuotes = currentState.quotes + quotes;
        yield QuotesSuccess(allQuotes);
      } catch (e) {
        yield QuotesError();
      }
    }
  }

  Stream<QuotesState> _mapQuotesGetToState(String categoryName) async* {
    yield QuotesLoading();
    try {
      var quotes = await quotesRepository.getQuotes(categoryName);
      print("Quotes from Firebase received");
      if (quotes.length == 0) {
        yield QuotesEmpty();
      } else {
        yield QuotesSuccess(quotes);
      }
    } catch (e) {
      yield QuotesError();
    }
  }
}
