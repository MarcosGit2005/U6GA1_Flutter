import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:u3ga1_marcosrubio/presentation/screens/info_comarca.dart';
import '../../data/counties.dart';

class ComarquesScreen extends StatelessWidget {
  final int idProvince;

  ComarquesScreen({required this.idProvince});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provincies["provincies"][idProvince]["provincia"]), // Título de la cabecera
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: _buildCards(context),
        ),
      ),
    );
  }

  // Método para construir cada Card
  List<GestureDetector> _buildCards(BuildContext context) {
    List<GestureDetector> cards = [];
    List<dynamic> comarques = provincies["provincies"][idProvince]["comarques"];
    for (Map<String,dynamic> comarca in comarques){
      cards.add(
        GestureDetector(
            onTap: () {
              context.push("/counties_info1/$idProvince/${comarques.indexOf(comarca)}");
            },
          child: Card(
            margin: EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(comarca["img"]), // Imagen de fondo desde la URL
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(12.0),
              child: Text(
                comarca["comarca"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black54,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          )
        )
      );
    }
    return cards;
  }
}