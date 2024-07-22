import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/function/functions.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/media_detail_view.dart';

class PhotoVaultSelectedView extends StatefulWidget {
  const PhotoVaultSelectedView({super.key});

  @override
  State<PhotoVaultSelectedView> createState() => _PhotoVaultSelectedViewState();
}

class _PhotoVaultSelectedViewState extends State<PhotoVaultSelectedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Vault",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffF9F9F9),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigation.ofPop(),
          icon: const Icon(
            Icons.close,
            size: 32,
            color: Color(0xffF9F9F9),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<PhotoVaultBloc, PhotoVaultState>(
        builder: (context, state) {
          var bloc = context.read<PhotoVaultBloc>();
          return customElevatedButton(
            () {
              Functions.showOptions(
                context,
                onPressedLibrary: () {
                  Navigation.ofPop();
                  bloc.add(const GalleryMedia());
                },
                onPressedCamera: () {
                  Navigation.ofPop();
                  bloc.add(const CameraMedia());
                },
                onCancel: () {
                  Navigation.ofPop();
                },
              );
            },
            "Add Medias",
          );
        },
      ),
      body: BlocBuilder<PhotoVaultBloc, PhotoVaultState>(
        bloc: context.read<PhotoVaultBloc>()..add(const FetchMedias()),
        builder: (context, state) {
          return state.localMediaModel.medias == null ||
                  state.localMediaModel.medias!.isEmpty
              ? Column(
                  children: [
                    const Spacer(
                      flex: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Image.asset(
                        "assets/images/photo_vault_1.png",
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Nothing to see here yet",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xffF9F9F9),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Tap to Add Photos button to move photos to the Photo Vault.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffF9F9F9),
                        ),
                      ),
                    ),
                    const Spacer(flex: 20),
                  ],
                )
              : GridView.builder(
                  itemCount: state.localMediaModel.medias?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 4, bottom: 200),
                  itemBuilder: (context, index) {
                    var mediaModel = state.localMediaModel.medias![index];

                    return GestureDetector(
                      onTap: () {
                        Navigation.push(
                            page: MediaDetailView(model: mediaModel));
                      },
                      child: Hero(
                        tag: mediaModel.id!,
                        child: mediaModel.thumbnail == null
                            ? const SizedBox.shrink()
                            : DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                      mediaModel.thumbnail!,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
