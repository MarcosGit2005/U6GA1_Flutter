import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String user = "";
  String password = "";

  Future<void> signUp(String email, String password) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("Usuario registrado correctamente");
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
              Text("Registrarse: "),
              const SizedBox(height: 40),
              // Campo de correo electrónico
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
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

              ElevatedButton(
                onPressed: () {
                  context.push("/");
                },
                child: Text('Cancelar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  signUp(this.user, this.password);
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