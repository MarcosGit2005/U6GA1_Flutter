import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/counties.dart';

class ComarcaInfo extends StatelessWidget {
  final int idProvince;
  final int idComarca;
  ComarcaInfo({required this.idProvince, required this.idComarca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provincies["provincies"][idProvince]["comarques"][idComarca]["comarca"]), // Título de la cabecera
      ),
      body: ComarcaInfoScreen(idProvince: idProvince,idComarca: idComarca),
    );
  }
}
class ComarcaInfoScreen extends StatefulWidget {
  final int idProvince;
  final int idComarca;

  ComarcaInfoScreen({required this.idProvince, required this.idComarca});

  @override
  _ComarcaInfoScreenState createState() => _ComarcaInfoScreenState(idProvince: idProvince,idComarca: idComarca);
}

class _ComarcaInfoScreenState extends State<ComarcaInfoScreen> {
  final int idProvince;
  final int idComarca;
  _ComarcaInfoScreenState({required this.idProvince, required this.idComarca});
  bool showFirstContent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showFirstContent
            ? _buildFirstContent()
            : _buildSecondContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showFirstContent = !showFirstContent;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildFirstContent() {
    return Column(
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
      ],
    );
  }

  Widget _buildSecondContent() {
    return Column(
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
            'Població: '+provincies["provincies"][idProvince]["comarques"][idComarca]["poblacio"]+'\nLatitud: '+provincies["provincies"][idProvince]["comarques"][idComarca]["coordenades"][0].toString()+
                '\nLongitud: '+provincies["provincies"][idProvince]["comarques"][idComarca]["coordenades"][1].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}