import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:video_player/video_player.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:page_transition/page_transition.dart';

import 'categorias/categorias.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key? key} ) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InicioPageState();
  }
}

class InicioPageState extends State<InicioPage>  with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late FlutterGifController controllerGif;
  late final player;

  @override
  void initState() {
    super.initState();
    if (kIsWeb || Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      controllerGif = FlutterGifController(vsync: this);
      player = AudioPlayer();
    }else{
      _controller = VideoPlayerController.asset(
        'assets/inicio.mp4',)
        ..initialize().then((_) {
          setState(() {});
        });
      _controller.addListener(checkVideo);
    }
  }

  Widget video (Size size){
    if (kIsWeb || Platform.isLinux || Platform.isWindows || Platform.isMacOS){
      controllerGif.value = 0;
      controllerGif.duration =Duration(milliseconds: 6170);
      controllerGif.animateTo(367);
      controllerGif.addListener(() {
        if (controllerGif.isCompleted){
          redireccionarCategorias();
        }
      });

      player.play(AssetSource('output.mp3'));

      return Container(
        height: size.height,
        width: size.width,
        child: GifImage(
          controller: controllerGif,
          image: AssetImage("assets/output.gif"),
          fit: BoxFit.contain,
        ),
      );
    }else{
      _controller.play();
      return _controller.value.isInitialized
          ? Center(
            child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
          )
    : Container();
    }
  }

  void checkVideo() {
    if (_controller.value.duration!=const Duration() && _controller.value.position == _controller.value.duration) {
      print('finish');
      redireccionarCategorias();
    }
  }

  void redireccionarCategorias(){
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 800), child: CategoriasPage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: video(size),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
            onPressed: () {
              redireccionarCategorias();
            },
            child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
      ),
    );
  }
}