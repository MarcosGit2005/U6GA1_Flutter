import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'provinces.dart';

class LoginScreen extends StatelessWidget {
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
                  context.push("/provinces");
                },
                child: Text('Iniciar sesión'),
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