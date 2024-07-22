import 'package:get_it/get_it.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/data/repository/local/local_media_repository.dart';
import 'package:protection_app/app/data/repository/local/vault_local_repository.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupRepositories();
  setupDatasource();
  setupBLoC();
}

void setupRepositories() {
  getIt
    ..registerLazySingleton<LocalMediaRepository>(
      () => LocalMediaRepository(),
    )
    ..registerLazySingleton<VaultLocalRepository>(
      () => VaultLocalRepository(),
    )
    ..registerLazySingleton<IsPremiumRepository>(
      () => IsPremiumRepository(),
    );
}

void setupDatasource() {}

void setupBLoC() {
  getIt
    ..registerLazySingleton<PhotoVaultBloc>(
      () => PhotoVaultBloc(),
    )
    ..registerLazySingleton<BrowseSecurelyCubit>(
      () => BrowseSecurelyCubit(),
    );
}
