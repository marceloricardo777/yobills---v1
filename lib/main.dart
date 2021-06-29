import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yobills/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Text(
              "Não foi possível inicializar o aplicativo",
              textDirection: TextDirection.ltr,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }
        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
