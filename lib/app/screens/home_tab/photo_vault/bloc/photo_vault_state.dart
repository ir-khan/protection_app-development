// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_vault_bloc.dart';

class PhotoVaultState extends Equatable {
  final bool isLoading;
  final LocalMediaModel localMediaModel;
  final int passwordIndex;
  final String password;

  const PhotoVaultState({
    required this.isLoading,
    required this.localMediaModel,
    required this.passwordIndex,
    required this.password,
  });

  PhotoVaultState copyWith({
    bool? isLoading,
    LocalMediaModel? localMediaModel,
    int? passwordIndex,
    String? password,
  }) {
    return PhotoVaultState(
      isLoading: isLoading ?? this.isLoading,
      localMediaModel: localMediaModel ?? this.localMediaModel,
      passwordIndex: passwordIndex ?? this.passwordIndex,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        localMediaModel,
        passwordIndex,
        password,
      ];
}
