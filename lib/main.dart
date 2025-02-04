import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import './config/router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return MaterialApp.router(
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      debugShowCheckedModeBanner: false,
                      title: 'Comarcas',
                      routerConfig: router, // Configuración de `go_router`
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text('Error al conectar con Firebase');
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ));
  }
}

