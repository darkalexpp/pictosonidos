// To parse this JSON data, do
//
//     final pictoSonido = pictoSonidoFromJson(jsonString);

import 'dart:convert';


class PictoSonido {
  PictoSonido({
    this.titulo='',
    required this.imagen,
    required this.audio,
  });

  String titulo;
  String imagen;
  String audio;

  factory PictoSonido.fromJson(Map<String, dynamic> json) => PictoSonido(
    titulo: json["titulo"],
    imagen: json["imagen"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "titulo": titulo,
    "imagen": imagen,
    "audio": audio,
  };
}
