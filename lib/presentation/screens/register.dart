import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'provinces.dart';

class RegisterScreen extends StatelessWidget {
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20), // Espacio entre los campos

              // Campo de contraseña
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // Para ocultar la contraseña
              ),
              const SizedBox(height: 40), // Espacio entre el campo y el botón

              // Botón de inicio de sesión
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
                  context.push("/");
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