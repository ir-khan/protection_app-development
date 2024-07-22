// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'breach_mail_search_bloc.dart';

class BreachMailSearchState extends Equatable {
  final bool isLoading;
  final List<BreachModel> breachEmailSearchModel;
  final String errorMessage;

  const BreachMailSearchState({
    required this.isLoading,
    required this.breachEmailSearchModel,
    required this.errorMessage,
  });

  BreachMailSearchState copyWith({
    bool? isLoading,
    List<BreachModel>? breachEmailSearchModel,
    String? errorMessage,
  }) {
    return BreachMailSearchState(
      isLoading: isLoading ?? this.isLoading,
      breachEmailSearchModel:
          breachEmailSearchModel ?? this.breachEmailSearchModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        breachEmailSearchModel,
        errorMessage,
      ];
}

// final class BreachMailSearchInitial extends BreachMailSearchState {}
