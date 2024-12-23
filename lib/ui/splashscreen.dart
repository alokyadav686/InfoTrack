import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infotrack/main.dart';
import 'package:infotrack/ui/loginscreen.dart';
import 'package:infotrack/ui/splashservices.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  
  @override
  
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // Home splashscreen =Home();

  Splashservices splashscreen = Splashservices();

  @override
  void initState() {
 
    Timer(Duration(seconds: 3),(){

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    
    splashscreen.islogin(context);
    super.initState();
    }); 

    
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splashbg1.png"),fit: BoxFit.cover),
          
        ),
      )
    );
  }
}