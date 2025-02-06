import 'package:flutter/material.dart';
import '../../data/peticions_http.dart';

class ComarcaInfo extends StatelessWidget {
  final String provinceName;
  final String comarcaName;
  ComarcaInfo({required this.provinceName, required this.comarcaName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comarcaName), // Título de la cabecera
      ),
      body: ComarcaInfoScreen(provinciaName: provinceName,comarcaName: comarcaName,),
    );
  }
}
class ComarcaInfoScreen extends StatefulWidget {
  final String provinciaName;
  final String comarcaName;

  ComarcaInfoScreen({required this.provinciaName, required this.comarcaName});

  @override
  _ComarcaInfoScreenState createState() => _ComarcaInfoScreenState(provinciaName: provinciaName,comarcaName: comarcaName,);
}

class _ComarcaInfoScreenState extends State<ComarcaInfoScreen> {
  final String provinciaName;
  final String comarcaName;
  _ComarcaInfoScreenState({required this.provinciaName, required this.comarcaName});

  late Future<dynamic> info;
  double latitud = 0;
  double longitud = 0;
  String imgUrl = "";
  String capital = "";
  String descripcion = "";

  bool showFirstContent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: obtenerInfoComarca(comarcaName),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            latitud = snapshot.data["latitud"];
            longitud = snapshot.data["longitud"];
            info = obteClima(
                longitud: longitud, latitud: latitud);

            imgUrl = snapshot.data["img"];
            capital = snapshot.data["capital"];
            descripcion = snapshot.data["desc"];

            return Center(
              child: showFirstContent
                  ? _buildFirstContent()
                  : _buildSecondContent(),
            );
          }
          return const CircularProgressIndicator();
        }
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
              image: NetworkImage(imgUrl), // Ruta de la imagen
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
                comarcaName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              // Subtítulo
              Text(
                'Capital: '+capital,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              // Descripción
              Text(
                descripcion,
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
    return FutureBuilder(
      future: info,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // Una vegada es resol el Future, tindrem disponible
          // la informació necessària per construir el giny
          String temperatura =
          snapshot.data["current_weather"]["temperature"].toString();
          String velVent =
          snapshot.data["current_weather"]["windspeed"].toString();
          String direccioVent =
          snapshot.data["current_weather"]["winddirection"].toString();
          String codi =
          snapshot.data["current_weather"]["weathercode"].toString();

          return Column(
            children: [
              _obtenirIconaOratge(codi),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.thermostat,
                    size: 35,
                  ),
                  Text(
                    "$temperaturaº",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wind_power, size: 35),
                  const SizedBox(width: 30),
                  Text(
                    "${velVent}km/h",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 30),
                  _obteGinyDireccioVent(double.parse(direccioVent)),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Latitud: $latitud",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Text(
                "Longitud: $longitud",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
  Widget _obteGinyDireccioVent(double direccioVent) {
    // Aquesta funció ens retorna una giny que conté
    // una icona i un text, amb la direcció i el nom del vent
    // segons la seua direcció.
    // Fem ús de `late` per indicar que assignarem el valor després
    // a les variables.

    late Icon icona;
    late String nomVent;

    if (direccioVent > 22.5 && direccioVent < 65.5) {
      icona = const Icon(Icons.north_east);
      nomVent = "Gregal";
    } else if (direccioVent > 67.5 && direccioVent < 112.5) {
      icona = const Icon(Icons.east);
      nomVent = "Llevant";
    } else if (direccioVent > 112.5 && direccioVent < 157.5) {
      icona = const Icon(Icons.south_east);
      nomVent = "Xaloc";
    } else if (direccioVent > 157.5 && direccioVent < 202.5) {
      icona = const Icon(Icons.south);
      nomVent = "Migjorn";
    } else if (direccioVent > 202.5 && direccioVent < 247.5) {
      icona = const Icon(Icons.south_west);
      nomVent = "Llebeig/Garbí";
    } else if (direccioVent > 247.5 && direccioVent < 292.5) {
      icona = const Icon(Icons.west);
      nomVent = "Ponent";
    } else if (direccioVent > 292.5 && direccioVent < 337.5) {
      icona = const Icon(Icons.north_west);
      nomVent = "Mestral";
    } else {
      icona = const Icon(Icons.north);
      nomVent = "Tramuntana";
    }
    return Row(children: [
      Text(
        nomVent,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      icona,
    ]);
  }

  Widget _obtenirIconaOratge(String value) {
    /*

    Aquesta funció obté un giny amb una imatge que es
    correspon al codi de l'oratge (Assolellat, núvo, etc.)

    Existeix una gran quantitat de codis per a l'oratge, que podem
    consultar a la web d'OpenMeteo:https://open-meteo.com/en/docs/dwd-api#weathervariables,
    a l'apartat "WMO Weather interpretation codes (WW)"

     */
    Set<String> sol = <String>{"0"};
    Set<String> pocsNuvols = <String>{"1", "2", "3"};
    Set<String> nuvols = <String>{"45", "48"};
    Set<String> plujasuau = <String>{"51", "53", "55"};
    Set<String> pluja = <String>{
      "61",
      "63",
      "65",
      "66",
      "67",
      "80",
      "81",
      "82",
      "95",
      "96",
      "99"
    };
    Set<String> neu = <String>{"71", "73", "75", "77", "85", "86"};

    if (sol.contains(value)) {
      return Image.asset("assets/icons/png/soleado.png");
    }
    if (pocsNuvols.contains(value)) {
      return Image.asset("assets/icons/png/poco_nublado.png");
    }
    if (nuvols.contains(value)) {
      return Image.asset("assets/icons/png/nublado.png");
    }
    if (plujasuau.contains(value)) {
      return Image.asset("assets/icons/png/lluvia_debil.png");
    }
    if (pluja.contains(value)) {
      return Image.asset("assets/icons/png/lluvia.png");
    }
    if (neu.contains(value)) {
      return Image.asset("assets/icons/png/nieve.png");
    }

    return Image.asset("assets/icons/png/poco_nublado.png");
  }
}