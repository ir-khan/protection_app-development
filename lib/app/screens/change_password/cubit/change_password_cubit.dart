import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:protection_app/app/data/repository/local/vault_local_repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit()
      : super(
          const ChangePasswordState(
            password: "",
          ),
        );

  final OtpFieldController otpFieldController = OtpFieldController();

  final VaultLocalRepository _vaultLocalRepository = VaultLocalRepository();
  final PageController pageController = PageController();

  String password = "";

  void getPassword() {
    password = _vaultLocalRepository.getVaultPassword() ?? "";
  }

  Future<void> changePassword(String pin) async {
    await _vaultLocalRepository.setVaultPassword(pin);
    emit(state.copyWith(password: pin));
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void savePassword(String pin) {
    emit(state.copyWith(password: pin));
  }

  void clear() {
    emit(state.copyWith(password: ""));
  }
}
