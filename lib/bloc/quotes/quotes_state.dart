part of 'quotes_bloc.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

class QuotesInitial extends QuotesState {}

class QuotesLoading extends QuotesState {
  @override
  String toString() => 'QuotesLoading';
}

class QuotesSuccess extends QuotesState {
  final List<Quote> quotes;

  QuotesSuccess(this.quotes);

  @override
  List<Object> get props => [quotes];

  @override
  String toString() => 'QuotesSuccess';
}

class QuotesError extends QuotesState {
  @override
  String toString() => 'QuotesError';
}
