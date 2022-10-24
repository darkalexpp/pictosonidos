import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../objects/pictosonido.dart';
import '../../widgets/ImageCard.dart';
import '../../widgets/ListaBotones.dart';
import 'YoQuiero.dart';

class CategoriasPage extends StatefulWidget {
  CategoriasPage({Key? key} ) : super(key: key);

  List<Map<String, dynamic>> categorias =
  [
    {
      'nombre': 'COMER',
      'icono': 'assets/categorias/comer.jpeg',
      'pagina': YoQuieroPage(tipo:'Comer'),
      'align': Alignment.topLeft,
    },
    {
      'nombre': 'ASEO',
      'icono': 'assets/categorias/aseo.jpeg',
      'truecolor' : true,
      'pagina': YoQuieroPage(tipo:'Aseo'),
      'align': Alignment.topRight,
    },
    {
      'nombre': 'JUEGOS',
      'icono': 'assets/categorias/juegos.jpeg',
      'truecolor' : true,
      'pagina': YoQuieroPage(tipo:'Juegos'),
      'align': Alignment.bottomLeft,
    },
    {
      'nombre': 'ACTIVIDADES Y ELEMENTOS DEL AULA',
      'icono': 'assets/categorias/rutina.jpeg',
      'truecolor' : true,
      'pagina': YoQuieroPage(tipo:'aula'),
      'align': Alignment.bottomRight,
    },
    {
      'nombre': 'HOGAR',
      'icono': 'assets/categorias/hogar.png',
      'truecolor' : true,
      'pagina': YoQuieroPage(tipo:'hogar'),
      'align': Alignment.bottomLeft,
    },
    {
      'nombre': 'VESTIMENTA',
      'icono': 'assets/categorias/vestimenta.png',
      'truecolor' : true,
      'pagina': YoQuieroPage(tipo:'vestimenta'),
      'align': Alignment.bottomRight,
    },
  ];

  @override
  State<StatefulWidget> createState() {
    return CategoriasPageState();
  }
}

class CategoriasPageState extends State<CategoriasPage> {

  @override
  void initState() {
    super.initState();
  }

  Widget CardCategria (Map<String,dynamic> categoria){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: categoria['align'], duration: Duration(milliseconds: 800), child: categoria['pagina']));
        },
          child: ImageCard(
              pictoSonido:PictoSonido.fromJson({"imagen":categoria['icono'],"titulo":categoria['nombre'],"audio":''}),
              borderColor: Colors.lightGreen,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                Expanded(child: CardCategria(widget.categorias[0])),
                Expanded(child: CardCategria(widget.categorias[1])),
                Expanded(child: CardCategria(widget.categorias[2])),
              ],),
            ),
            Expanded(
              child: Row(children: [
                Expanded(child: CardCategria(widget.categorias[3])),
                Expanded(child: CardCategria(widget.categorias[4])),
                Expanded(child: CardCategria(widget.categorias[5])),
              ],)
            )
          ],
        ),
      ),
    );
  }
}
