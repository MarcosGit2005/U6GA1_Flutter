import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/counties.dart';
import 'info_comarca_2.dart';

class ComarcaInfo1 extends StatelessWidget {
  final int idProvince;
  final int idComarca;

  ComarcaInfo1({required this.idProvince, required this.idComarca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provincies["provincies"][idProvince]["comarques"][idComarca]["comarca"]), // Título de la cabecera
      ),
      body: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen en la parte superior
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(provincies["provincies"][idProvince]["comarques"][idComarca]["img"]), // Ruta de la imagen
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    provincies["provincies"][idProvince]["comarques"][idComarca]["comarca"],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Subtítulo
                  Text(
                    'Capital: '+provincies["provincies"][idProvince]["comarques"][idComarca]["capital"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Descripción
                  Text(
                    provincies["provincies"][idProvince]["comarques"][idComarca]["desc"],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push("/counties_info2/$idProvince/$idComarca");
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/img/weather.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}