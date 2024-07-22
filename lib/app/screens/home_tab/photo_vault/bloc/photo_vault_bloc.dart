import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/models/local/local_media_model.dart';
import 'package:protection_app/app/data/models/local/media_model.dart';
import 'package:protection_app/app/data/repository/local/local_media_repository.dart';
import 'package:protection_app/app/data/repository/local/vault_local_repository.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/password_view.dart';

import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'photo_vault_event.dart';
part 'photo_vault_state.dart';

class PhotoVaultBloc extends Bloc<PhotoVaultEvent, PhotoVaultState> {
  PhotoVaultBloc()
      : super(
          PhotoVaultState(
            isLoading: false,
            localMediaModel: LocalMediaModel(),
            passwordIndex: 0,
            password: "",
          ),
        ) {
    on<GalleryMedia>(_onGalleryMedia);
    on<CameraMedia>(_onCameraMedia);
    on<FetchMedias>(_onFetchMedias);
    on<SaveMedia>(_onSaveMedia);
    on<CreatePassword>(_onCreatePassword);
    on<FetchPassword>(_onFetchPassword);
    on<RemoveMedias>(_onRemoveMedias);
  }
  final ImagePicker _picker = ImagePicker();
  final PageController pageController = PageController();
  PageController passwordPageController = PageController();
  final OtpFieldController otpFieldController = OtpFieldController();
  final TextEditingController textEditingController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  String password = "";
  String pin = "";

  final LocalMediaRepository _localMediaRepository = LocalMediaRepository();
  final VaultLocalRepository _vaultLocalRepository = VaultLocalRepository();

  void _onFetchMedias(FetchMedias event, Emitter<PhotoVaultState> emit) {
    var localMediaModel = _localMediaRepository.getAll();
    emit(state.copyWith(localMediaModel: localMediaModel));
  }

  Future<void> _onSaveMedia(
      SaveMedia event, Emitter<PhotoVaultState> emit) async {
    await _localMediaRepository.create(state.localMediaModel);
  }

  Future<void> _onRemoveMedias(
      RemoveMedias event, Emitter<PhotoVaultState> emit) async {
    var medias = List<MediaModel>.from(state.localMediaModel.medias!);
    medias.removeWhere((element) => element.id == event.id);
    await _localMediaRepository.update(state.localMediaModel);
    emit(state.copyWith(
        localMediaModel: LocalMediaModel(
      key: 'media',
      medias: medias,
    )));
    // SaveMeadia add remove medias
    add(const SaveMedia());
  }

  Future<void> _onGalleryMedia(
      GalleryMedia event, Emitter<PhotoVaultState> emit) async {
    final pickedFile = await _picker.pickMultipleMedia(
      imageQuality: 100,
    );
    List<XFile> xFilePick = pickedFile;
    List<MediaModel> medias = [];
    if (xFilePick.isNotEmpty) {
      for (var i = 0; i < xFilePick.length; i++) {
        final mimeType = lookupMimeType(xFilePick[i].path);

        if (mimeType!.startsWith('image')) {
          var uint8list = await xFilePick[i].readAsBytes();
          var mediaModel = MediaModel(
            id: const Uuid().v4(),
            media: xFilePick[i].path,
            thumbnail: uint8list,
            type: mimeType,
            date: DateFormat("d MMMM, y").format(DateTime.now()),
          );
          medias.add(mediaModel);
        } else if (mimeType.startsWith('video')) {
          final Uint8List? uint8list = await VideoThumbnail.thumbnailData(
            video: xFilePick[i].path,
            imageFormat: ImageFormat.JPEG,
            maxWidth: 512,
            quality: 25,
          );
          var mediaModel = MediaModel(
            id: const Uuid().v4(),
            media: xFilePick[i].path,
            thumbnail: uint8list,
            type: mimeType,
            date: DateFormat("d MMMM, y").format(DateTime.now()),
          );
          medias.add(mediaModel);
        }
      }
    }
    emit(state.copyWith(
        localMediaModel: LocalMediaModel(
      key: 'media',
      medias: [
        ...state.localMediaModel.medias ?? [],
        ...medias,
      ],
    )));
    add(const SaveMedia());
  }

  Future<void> _onCameraMedia(
      CameraMedia event, Emitter<PhotoVaultState> emit) async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      var uint8list = await file.readAsBytes();

      final mimeType = lookupMimeType(file.path);
      // final mimeType = lookupMimeType('image');
      var mediaModel = MediaModel(
        id: const Uuid().v4(),
        media: file.path,
        type: mimeType!.splitMapJoin('/'),
        date: DateFormat("d MMMM, y").format(DateTime.now()),
        thumbnail: uint8list,
      );
      emit(state.copyWith(
          localMediaModel: LocalMediaModel(
        key: 'media',
        medias: [
          ...state.localMediaModel.medias ?? [],
          mediaModel,
        ],
      )));
      print(mediaModel.media);
      add(const SaveMedia());
    }
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    if (pageController.page! > 0) {
      Navigation.ofPop();
      _vaultLocalRepository.sawVaultOnboarding();
      Navigation.push(page: const PasswordView());
    }
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void nextPagePassword() {
    passwordPageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void previousPagePassword() {
    passwordPageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onCreatePassword(CreatePassword event, Emitter<PhotoVaultState> emit) {
    emit(state.copyWith(password: event.pin));
  }

  void _onFetchPassword(FetchPassword event, Emitter<PhotoVaultState> emit) {
    password = _vaultLocalRepository.getVaultPassword() ?? "";
  }

  void passwordControl() {
    var vaultPassword = VaultLocalRepository().getVaultPassword() ?? "";
    if (vaultPassword.isNotEmpty) {
      passwordPageController = PageController(initialPage: 2);
    }
  }

  void showAlertDialog(BuildContext context, String id) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: const Text('Are you sure want delete?'),
          content: const Text('If you delete,it will be loss.'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                context.read<PhotoVaultBloc>().add(RemoveMedias(id));
                Navigator.pop(context);
                // context
                //     .read<PhotoVaultBloc>()
                //     .removeImage(state.localMediaModel.medias!.last.id!);
                // Navigation.push(page: PhotoVaultSelectedView());
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                    color: TextColors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel',
                  style: TextStyle(
                    color: TextColors.blue,
                    fontWeight: FontWeight.w500,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
