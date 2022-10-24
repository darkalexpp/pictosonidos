import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    //nuevos
    PictoSonido.fromJson({"imagen":'assets/comer/cake.png',"titulo":'Cake',"audio":'assets/comer/Cake.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/cereza (1).png',"titulo":'Cereza',"audio":'assets/comer/Cereza.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/chupete.png',"titulo":'Chupete',"audio":'assets/comer/Chupete.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/frutilla.png',"titulo":'Frutilla',"audio":'assets/comer/Frutilla.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/gelatina.png',"titulo":'Gelatina',"audio":'assets/comer/Gelatina.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/helado.png',"titulo":'Helado',"audio":'assets/comer/Helado.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/limon.png',"titulo":'Limón',"audio":'assets/comer/Limon.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/pastel de chocolate (2).png',"titulo":'Papas fritas',"audio":'assets/comer/Papas fritas.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/patatas fritas.png',"titulo":'Pastel de chocolate',"audio":'assets/comer/Pastel de chocolate.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/comer/sandia.png',"titulo":'Sandía',"audio":'assets/comer/Sandia.m4a'}),
  ];

  List<PictoSonido> aseo = [
    PictoSonido.fromJson({"imagen":'assets/aseo/banarme.jpeg',"titulo":'Bañarme',"audio":'assets/aseo/banarme.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/dientes.jpeg',"titulo":'Lavarme los Dientes',"audio":'assets/aseo/dientes.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/cara.jpeg',"titulo":'Lavarme la Cara',"audio":'assets/aseo/cara.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/manos.jpeg',"titulo":'Laverme las Manos',"audio":'assets/aseo/manos.m4a'}),
    //nuevos
    PictoSonido.fromJson({"imagen":'assets/aseo/ayuda.png',"titulo":'Ayuda',"audio":'assets/aseo/Ayuda.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/banerme con juguetes.png',"titulo":'Bañarme con juguetes',"audio":'assets/aseo/Banarme con juguetes.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/coger el papel..png',"titulo":'Coger el papel',"audio":'assets/aseo/Coger el papel.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/escurrir las manos..png',"titulo":'Escurrir las manos',"audio":'assets/aseo/Escurrir las manos.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/limpiar el cepillo (1).png',"titulo":'Limpiar el cepillo',"audio":'assets/aseo/Limpiar el cepillo.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/limpiar el cepillo de dientes..png',"titulo":'Limpiar el cepillo de dientes',"audio":'assets/aseo/Limpiar el cepillo de dientes.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/limpiar.png',"titulo":'Limpiar',"audio":'assets/aseo/Limpiar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/limpiarme con la toalla.png',"titulo":'Limpiarme con la toalla',"audio":'assets/aseo/Limpiarme con la toalla.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/quedarme solo en el bano.png',"titulo":'Quedarme solo en el baño',"audio":'assets/aseo/Quedarme solo en el bano.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/aseo/sonarme la nariz..png',"titulo":'Sonarme la nariz',"audio":'assets/aseo/Sonarme la nariz.m4a'}),
  ];

  List<PictoSonido> juegos = [
    PictoSonido.fromJson({"imagen":'assets/juegos/animales.jpeg',"titulo":'Animales',"audio":'assets/juegos/animales.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/carro.jpeg',"titulo":'Carro',"audio":'assets/juegos/carro.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/pelota.jpeg',"titulo":'Pelota',"audio":'assets/juegos/pelota.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/jugar.jpeg',"titulo":'Jugar',"audio":'assets/juegos/jugar.m4a'}),
    //nuevos
    PictoSonido.fromJson({"imagen":'assets/juegos/anillos.png',"titulo":'Anillos',"audio":'assets/juegos/Anillos.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/camion de juguete.png',"titulo":'Camión de juguete',"audio":'assets/juegos/Camion de juguete.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/muneco.png',"titulo":'Muñeco',"audio":'assets/juegos/Muneco.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/patito de goma (1).png',"titulo":'Patito de goma',"audio":'assets/juegos/Patito de goma.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/peluche de dinosaurio.png',"titulo":'Peluche',"audio":'assets/juegos/Peluche.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/pop it.png',"titulo":'Pop it',"audio":'assets/juegos/Pop it 2.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/rompecabezas para atar zapatos.png',"titulo":'Rompe cabezas para atar los zapatos',"audio":'assets/juegos/Rompe cabezas para atar los zapatos.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/rompecabezas.png',"titulo":'Rompe cabezas',"audio":'assets/juegos/Rompe cabezas.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/titeres.png',"titulo":'Títeres',"audio":'assets/juegos/Titeres.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/juegos/triciclo.png',"titulo":'Triciclo',"audio":'assets/juegos/Triciclo.m4a'}),

  ];

  List<PictoSonido> aula = [
    PictoSonido.fromJson({"imagen":'assets/rutina/cantar.jpeg',"titulo":'Cantar',"audio":'assets/rutina/cantar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/cuento.jpeg',"titulo":'Cuento',"audio":'assets/rutina/cuento.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/pintar.jpeg',"titulo":'Pintar',"audio":'assets/rutina/pintar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/jugar.jpeg',"titulo":'Jugar',"audio":'assets/rutina/jugar.m4a'}),
    //nuevos
    PictoSonido.fromJson({"imagen":'assets/rutina/bailar..png',"titulo":'Bailar',"audio":'assets/rutina/Bailar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/escuchar musica..png',"titulo":'Escuchar música',"audio":'assets/rutina/Escuchar musica.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/levantar la mano..png',"titulo":'Levantar la mano',"audio":'assets/rutina/Levantar la mano.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/levantarme de la silla..png',"titulo":'Levantarme de la silla',"audio":'assets/rutina/Levantarme de la silla.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/pintura de agua.png',"titulo":'Pintura de agua',"audio":'assets/rutina/Pintura de agua.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/pinturas..png',"titulo":'Pinturas',"audio":'assets/rutina/Pinturas.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/plastilina..png',"titulo":'Plastilina',"audio":'assets/rutina/Plastilina.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/senalar..png',"titulo":'Señalar',"audio":'assets/rutina/Senalar.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/sentarme..png',"titulo":'Sentarme',"audio":'assets/rutina/Sentarme.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/rutina/soplar..png',"titulo":'Soplar',"audio":'assets/rutina/Soplar.m4a'}),
  ];

  List<PictoSonido> hogar = [
    PictoSonido.fromJson({"imagen":'assets/hogar/almohada.png',"titulo":'Almohada',"audio":'assets/hogar/Almohada.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/cama.png',"titulo":'Cama',"audio":'assets/hogar/Cama.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/celular.png',"titulo":'Celular',"audio":'assets/hogar/Celular.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/cocina.png',"titulo":'Cocina',"audio":'assets/hogar/Cocina.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/cuchara.png',"titulo":'Cuchara',"audio":'assets/hogar/Cuchara.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/jardin.png',"titulo":'Jardín',"audio":'assets/hogar/Jardin.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/juguetes.png',"titulo":'Juguetes',"audio":'assets/hogar/Juguetes.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/mesa.png',"titulo":'Mesa',"audio":'assets/hogar/Mesa.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/plato.png',"titulo":'Plato',"audio":'assets/hogar/Plato.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/sofa.png',"titulo":'Sofá',"audio":'assets/hogar/Sofa.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/television.png',"titulo":'Televisión',"audio":'assets/hogar/Television.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/tenedor.png',"titulo":'Tenedor',"audio":'assets/hogar/Tenedor.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/hogar/vaso.png',"titulo":'Vaso',"audio":'assets/hogar/Vaso.m4a'}),
  ];

  List<PictoSonido> vestimenta = [
    PictoSonido.fromJson({"imagen":'assets/vestimenta/body.png',"titulo":'Body',"audio":'assets/vestimenta/Body.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/chaqueta..png',"titulo":'Chaqueta',"audio":'assets/vestimenta/Chaqueta.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/chompa.png',"titulo":'Chompa',"audio":'assets/vestimenta/Chompa.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/crema de sol.png',"titulo":'Crema de sol',"audio":'assets/vestimenta/Crema de sol.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/gorra..png',"titulo":'Gorra',"audio":'assets/vestimenta/Gorra.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/mandil.png',"titulo":'Mandil',"audio":'assets/vestimenta/Mandil.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/medias.png',"titulo":'Medias',"audio":'assets/vestimenta/Medias.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/panal.png',"titulo":'Pañal',"audio":'assets/vestimenta/Panal.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/pantalon..png',"titulo":'Pantalón',"audio":'assets/vestimenta/Pantalon.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/ponerme la casaca .png',"titulo":'Ponerme la casaca',"audio":'assets/vestimenta/Ponerme la casaca.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/quitarme la media.png',"titulo":'Quitarme la media',"audio":'assets/vestimenta/Quitarme la media.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/quitarme los zapatos.png',"titulo":'Quitarme los zapatos',"audio":'assets/vestimenta/Quitarme los zapatos.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/ropa interior.png',"titulo":'Ropa interior',"audio":'assets/vestimenta/Ropa interior.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/subirme el pantalon.png',"titulo":'Subirme el pantalón',"audio":'assets/vestimenta/Subirme el pantalon.m4a'}),
    PictoSonido.fromJson({"imagen":'assets/vestimenta/subirse la camiseta.png',"titulo":'Subirme la camiseta',"audio":'assets/vestimenta/Subirme la camiseta.m4a'}),

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
      case 'aula':
        listaPictoSonidos=aula;
        break;
      case 'hogar':
        listaPictoSonidos=hogar;
        break;
      case 'vestimenta':
        listaPictoSonidos=vestimenta;
        break;
    }
    listaPictoSonidos.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                child: SizedBox(
                  width: size.width,
                  child: CarouselSlider(
                      items: List.generate(listaPictoSonidos.length, (index) =>
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
                                  borderColor: Theme.of(context).colorScheme.secondary,)),),),
                      options: CarouselOptions(
                        aspectRatio: 1/1,
                        viewportFraction: 0.25,
                        initialPage: 1,
                        enableInfiniteScroll: true,
                        reverse: false,
                        enlargeCenterPage: true,
                        onPageChanged: (int d,f){},
                        scrollDirection: Axis.horizontal,
                      )
                  ),
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