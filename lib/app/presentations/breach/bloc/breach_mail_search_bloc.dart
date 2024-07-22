import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/breach_email_searh_repository.dart';
import 'package:protection_app/app/data/models/breach_model.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach_in.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach_not.dart';

part 'breach_mail_search_event.dart';
part 'breach_mail_search_state.dart';

class BreachMailSearchBloc
    extends Bloc<BreachMailSearchEvent, BreachMailSearchState> {
  final BreachEmailSearchRepository breachEmailSearchRepository;
  BreachMailSearchBloc(this.breachEmailSearchRepository)
      : super(const BreachMailSearchState(
            isLoading: false, breachEmailSearchModel: [], errorMessage: "")) {
    on<FetchBreach>(_onFetchBreach);
  }

  final TextEditingController emailController = TextEditingController();

  Future<void> _onFetchBreach(
      FetchBreach event, Emitter<BreachMailSearchState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final mailSearch = await BreachEmailSearchRepository.searchMail(
          emailController.text.trim());
      emit(state.copyWith(
        isLoading: false,
        breachEmailSearchModel: mailSearch,
      ));
      state.breachEmailSearchModel.isNotEmpty
          ? Navigation.push(page: DataBreachIn())
          : Navigation.push(
              page: DataBreachNot(
              mail: emailController.text.trim(),
            ));

      emailController.clear();
    } catch (e) {
      Navigation.push(
          page: DataBreachNot(
        mail: emailController.text.trim(),
      ));
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      emailController.clear();
    }
  }
}
