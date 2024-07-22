part of 'photo_vault_bloc.dart';

sealed class PhotoVaultEvent extends Equatable {
  const PhotoVaultEvent();

  @override
  List<Object> get props => [];
}

class FetchMedias extends PhotoVaultEvent {
  const FetchMedias();
}

class SaveMedia extends PhotoVaultEvent {
  const SaveMedia();
}

class CameraMedia extends PhotoVaultEvent {
  const CameraMedia();
}

class GalleryMedia extends PhotoVaultEvent {
  const GalleryMedia();
}

class RemoveMedias extends PhotoVaultEvent {
  final String id;
  const RemoveMedias(this.id);

  @override
  List<Object> get props => [id];
}

class CreatePassword extends PhotoVaultEvent {
  final String pin;
  const CreatePassword(this.pin);
  @override
  List<Object> get props => [pin];
}

class FetchPassword extends PhotoVaultEvent {
  const FetchPassword();
}
