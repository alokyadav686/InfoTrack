import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/firebase_options.dart';
import 'package:infotrack/ui/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Splashscreen(),
  ));

}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        color: Colors.green,
      ),
    );
  }
}