import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/counties.dart';
import 'counties.dart';

class ProvinciasScreen extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error al cerrar sesión: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_auth.currentUser!.email!),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: InkWell(
                    child: Text("Cerrar sesión"),
                    onTap: () {
                      Navigator.pop(context);
                      signOut();
                    },
                  ),
              ),
            ];
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primer círculo
            _buildCircle(context, 2),
            SizedBox(height: 30), // Espacio entre los círculos
            // Segundo círculo
            _buildCircle(context,0),
            SizedBox(height: 30), // Espacio entre los círculos
            // Tercer círculo
            _buildCircle(context, 1),
          ],
        ),
      ),
    );
  }

  // Método para construir cada círculo
  Widget _buildCircle(BuildContext context, int id) {
    return GestureDetector(
      onTap: () {
        context.push("/counties/$id");
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(provincies["provincies"][id]["img"]),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          provincies["provincies"][id]["provincia"],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: '',
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Pantalla de destino para el primer círculo
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opción 1')),
      body: Center(child: Text('Pantalla de Opción 1')),
    );
  }
}
