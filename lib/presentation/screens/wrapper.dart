import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u3ga1_marcosrubio/presentation/screens/login.dart';
import 'package:u3ga1_marcosrubio/presentation/screens/provinces.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.connectionState==ConnectionState.active){
            final user = snapshot.data;
            if (user==null){
              return LoginScreen();
            } else {
              return ProvinciasScreen();
            }
          }
          return CircularProgressIndicator();
        }
    );
  }
}
