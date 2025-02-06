import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:u3ga1_marcosrubio/data/peticions_http.dart';

class ComarquesScreen extends StatelessWidget {
  final String provinceName;

  ComarquesScreen({required this.provinceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provinceName), // Título de la cabecera
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: obtenerComarcas(provinceName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<GestureDetector> comarcasList = [];
              snapshot.data.forEach((comarca) => {
                comarcasList.add(_buildCard(context,comarca['nom'],comarca['img']))
              });

              return ListView(
                scrollDirection: Axis.vertical,
                children: comarcasList,
              );
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }

  // Mét0do para construir cada Card
GestureDetector _buildCard(BuildContext context,String comarcaName, String comarcaImgSource) {
    return GestureDetector(
      onTap: () {
        context.push("/counties_info/$provinceName/$comarcaName");
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(comarcaImgSource), // Imagen de fondo desde la URL
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(12.0),
          child: Text(
            comarcaName,
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
      ),
    );
  }
}
