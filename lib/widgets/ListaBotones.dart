import 'package:flutter/material.dart';


class ListaBotones extends StatelessWidget {

  ListaBotones({Key? key, required this.lista, int? this.columna}) : super(key: key);
  final List<Map<String, dynamic>> lista;
  int? columna;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: GridView.count(
          padding: const EdgeInsets.all(25),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          crossAxisCount: columna ?? size.width~/145,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 20.0,
          children: List.generate(lista.length, (index) {
            return GestureDetector(
              onTap: (lista[index]["onTap"]==null)?() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lista[index]['pagina'],
                    ));
              }: lista[index]["onTap"],
              child: Expanded(
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shadowColor: Colors.black,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                              child: Image.asset(lista[index]['icono'],
                              fit: BoxFit.cover,)
                            ),
                    ),

                    Text(
                      lista[index]['nombre'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
              ),
            );
          },
          ),
        )
    );
  }
}