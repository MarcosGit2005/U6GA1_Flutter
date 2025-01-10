import 'package:flutter/material.dart';
import '../../data/counties.dart';

class ComarcaInfo2 extends StatelessWidget {
  int idProvince = 0;
  int idComarca = 0;

  Map<String,dynamic> datosComarca = {};

  ComarcaInfo2(int idProvince, int idComarca){
    this.idProvince = idProvince;
    this.idComarca = idComarca;
    datosComarca = provincies["provincies"][idProvince]["comarques"][idComarca];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosComarca["comarca"]), // Título de la cabecera
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen en la parte superior
          Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/weather.png'), // Ruta de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              )
          ),
          SizedBox(height: 8),
          // Temperatura
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.thermostat,
                size: 24,
                color: Colors.grey[600],
              ),
              SizedBox(width: 4),
              Text(
                '15.4°',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Velocidad y dirección del viento
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.air,
                size: 24,
                color: Colors.grey[600],
              ),
              SizedBox(width: 4),
              Text(
                '9.4km/h Ponent',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Información adicional
          Center(
            child: Text(
              'Població: '+datosComarca["poblacio"]+'\nLatitud: '+datosComarca["coordenades"][0].toString()+
                  '\nLongitud: '+datosComarca["coordenades"][1].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

}