import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String user = "";
  String password = "";

  Future<void> signIn(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Inicio de sesión exitoso");
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen en la parte superior
              Image.asset(
                'assets/img/mapa_comunidad_valenciana.png', // Asegúrate de tener la imagen en assets y configurar el pubspec.yaml
                height: 150,
              ),
              const SizedBox(height: 40), // Espacio entre la imagen y los TextFields

              // Campo de correo electrónico
              TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                onChanged: (text) {
                  this.user = text;
                },
              ),
              const SizedBox(height: 20), // Espacio entre los campos

              // Campo de contraseña
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (text) {
                  this.password = text;
                },
                obscureText: true, // Para ocultar la contraseña
              ),
              const SizedBox(height: 40), // Espacio entre el campo y el botón

              // Botón de inicio de sesión
              ElevatedButton(
                onPressed: () {
                  signIn(this.user, this.password);
                },
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push("/register");
                },
                child: Text('Registrarse'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}