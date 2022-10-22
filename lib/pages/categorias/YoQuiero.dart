import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../widgets/ImageCard.dart';
import '../../objects/pictosonido.dart';
import 'package:page_transition/page_transition.dart';

import 'categorias.dart';

class YoQuieroPage extends StatefulWidget {
  YoQuieroPage({Key? key,required this.tipo}) : super(key: key);
  String tipo;

  get _this => this;

  @override
  State<StatefulWidget> createState() {
    return YoQuieroPageState();
  }
}

class YoQuieroPageState extends State<YoQuieroPage> {

  Widget widgetSeleccionado = Container();
  PictoSonido? seleccionado;
  final player = AudioPlayer();


  List<PictoSonido> comer = [
    PictoSonido.fromJson({"imagen":'assets/comer/uvas.jpeg',"titulo":'Uvas',"audio":'assets/comer/uvas.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/guineo.jpeg',"titulo":'Guineo',"audio":'assets/comer/guineo.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/manzana.jpeg',"titulo":'Manzana',"audio":'assets/comer/manzana.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/agua.jpeg',"titulo":'Agua',"audio":'assets/comer/agua.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/galletas.jpeg',"titulo":'Galletas',"audio":'assets/comer/galletas.m4a'}),
  ];

  List<PictoSonido> aseo = [
    PictoSonido.fromJson({"imagen":'assets/aseo/banarme.jpeg',"titulo":'Bañarme',"audio":'assets/aseo/banarme.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/dientes.jpeg',"titulo":'Lavarme los Dientes',"audio":'assets/aseo/dientes.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/cara.jpeg',"titulo":'Lavarme la Cara',"audio":'assets/aseo/cara.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/manos.jpeg',"titulo":'Laverme las Manos',"audio":'assets/aseo/manos.m4a'}),
  ];

  List<PictoSonido> juegos = [
    PictoSonido.fromJson({"imagen":'assets/juegos/animales.jpeg',"titulo":'Animales',"audio":'assets/juegos/animales.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/carro.jpeg',"titulo":'Carro',"audio":'assets/juegos/carro.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/pelota.jpeg',"titulo":'Pelota',"audio":'assets/juegos/pelota.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/jugar.jpeg',"titulo":'Jugar',"audio":'assets/juegos/jugar.m4a'}),

  ];

  List<PictoSonido> rutina = [
    PictoSonido.fromJson({"imagen":'assets/rutina/cantar.jpeg',"titulo":'Cantar',"audio":'assets/rutina/cantar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/cuento.jpeg',"titulo":'Cuento',"audio":'assets/rutina/cuento.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/pintar.jpeg',"titulo":'Pintar',"audio":'assets/rutina/pintar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/jugar.jpeg',"titulo":'Jugar',"audio":'assets/rutina/jugar.m4a'}),
  ];

  late List<PictoSonido> listaPictoSonidos;

  @override
  void initState() {
    super.initState();
    switch (widget.tipo){
      case "Aseo":
        listaPictoSonidos=aseo;
        break;
      case "Comer":
        listaPictoSonidos=comer;
        break;
      case "Juegos":
        listaPictoSonidos=juegos;
        break;
      case 'Rutina de aula':
        listaPictoSonidos=rutina;
        break;
    }
    listaPictoSonidos.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                children: [
                  Expanded(child: ImageCard(
                      pictoSonido:PictoSonido.fromJson({"imagen":'assets/yo.jpeg',"titulo":'Yo',"audio":''}),
                    borderColor: Colors.yellow,)),
                  Expanded(child:ImageCard(pictoSonido:PictoSonido.fromJson({"imagen":'assets/quiero.jpeg',"titulo":'Quiero',"audio":''}),
                    borderColor: Colors.lightGreen,)),
                  Expanded(child:
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: widgetSeleccionado),
                  ),
                ],
                ),
              ),
            ),
            Expanded( child:
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
              ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: List.generate(listaPictoSonidos.length, (index) =>
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState((){
                              seleccionado = listaPictoSonidos[index];
                              widgetSeleccionado = ImageCard(pictoSonido: seleccionado!,
                                borderColor: Theme.of(context).colorScheme.secondary,key: ValueKey(index),);
                              player.play(AssetSource('yoquiero.m4a'));
                              Future.delayed(const Duration(milliseconds: 1200), (){
                                player.play(AssetSource(seleccionado!.audio.replaceAll('assets/', '')));
                              });
                            });
                          },
                          child:  ImageCard(pictoSonido: listaPictoSonidos[index],
                            textColor: Color(0xffe57d90),
                            borderColor: Theme.of(context).colorScheme.secondary,)),)
                  )
                ),
              ),
            ),
            )
            //ListaBotones(lista: widget.categorias,columna: 2),
          ],
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: FloatingActionButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightPop,
                duration: const Duration(milliseconds: 800),
                child: CategoriasPage(), childCurrent: widget._this));
          },
          child: const Icon(Icons.arrow_back_outlined, color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}