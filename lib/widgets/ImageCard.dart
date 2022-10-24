import 'package:flutter/material.dart';

import '../objects/pictosonido.dart';


class ImageCard extends StatelessWidget {

  ImageCard({Key? key, required this.pictoSonido,this.textColor, this.borderColor}) : super(key: key);
  final PictoSonido pictoSonido;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
          children: [
            Expanded(
              child: Card(
                elevation: 8,
                shadowColor: Colors.black,
                color: Colors.white,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                        width: 8,
                        color: borderColor ?? Colors.transparent
                    )
                ),
                child: Image.asset(pictoSonido.imagen,
                  fit: BoxFit.cover,),
              ),
            ),
            Text(
              pictoSonido.titulo.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: textColor ?? Colors.white),
            )
          ],
    );
  }
}