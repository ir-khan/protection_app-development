part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final String password;

  const ChangePasswordState({
    required this.password,
  });

  ChangePasswordState copyWith({
    String? password,
  }) {
    return ChangePasswordState(
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        password,
      ];
}
