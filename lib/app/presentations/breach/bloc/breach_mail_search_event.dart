part of 'breach_mail_search_bloc.dart';

sealed class BreachMailSearchEvent extends Equatable {
  const BreachMailSearchEvent();

  @override
  List<Object> get props => [];
}

final class FetchBreach extends BreachMailSearchEvent {
  const FetchBreach();

  @override
  List<Object> get props => [];
}
