part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class QuotesGetNext extends QuotesEvent {
  final String category;

  QuotesGetNext(this.category);
  @override
  String toString() => 'QuotesGetNext';
}

class QuotesGet extends QuotesEvent {
  final String category;

  QuotesGet(this.category);
  @override
  String toString() => 'QuotesGet';
}
