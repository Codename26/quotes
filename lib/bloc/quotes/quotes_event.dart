part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class QuotesInit extends QuotesEvent {
  @override
  String toString() => 'QuotesInit';
}

class QuotesGetNext extends QuotesEvent {
  @override
  String toString() => 'QuotesGetNext';
}
