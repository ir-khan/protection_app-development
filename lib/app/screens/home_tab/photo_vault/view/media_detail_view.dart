import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/models/local/media_model.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';
import 'package:video_player/video_player.dart';

class MediaDetailView extends StatefulWidget {
  final MediaModel model;
  const MediaDetailView({
    super.key,
    required this.model,
  });

  @override
  State<MediaDetailView> createState() => _MediaDetailViewState();
}

class _MediaDetailViewState extends State<MediaDetailView> {
  VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("");

  @override
  void initState() {
    super.initState();
    if (widget.model.type!.startsWith('video')) {
      _videoPlayerController =
          VideoPlayerController.file(File(widget.model.media!))
            ..initialize().then((value) => setState(() {}));
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (widget.model.type!.startsWith('image'))
                Hero(
                  tag: widget.model.id!,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.memory(
                        widget.model.thumbnail!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (widget.model.type!.startsWith('video'))
                Hero(
                  tag: widget.model.id!,
                  child: _videoPlayerController.value.isInitialized
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _videoPlayerController.value.isPlaying
                                  ? _videoPlayerController.pause()
                                  : _videoPlayerController.play();
                            });
                          },
                          child: AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  VideoPlayer(_videoPlayerController),
                                  if (widget.model.type!.startsWith('video') &&
                                      _videoPlayerController
                                          .value.isInitialized)
                                    !_videoPlayerController.value.isPlaying
                                        ? Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black54
                                                    .withOpacity(0.7)),
                                            child: Icon(
                                              color: Colors.white,
                                              Icons.play_arrow,
                                            ),
                                          )
                                        : SizedBox.shrink()
                                  // : SizedBox.shrink(),""
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(
                              widget.model.thumbnail!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    widget.model.date!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () =>
                          context.read<PhotoVaultBloc>().showAlertDialog(
                                context,
                                widget.model.id!,
                              ),
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/trash.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFFF1F1F),
                              color: Color(0xFFFF1F1F),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
