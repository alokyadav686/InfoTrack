import 'package:flutter/material.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: 
          
          [
            Text("check", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            
            Container(width: 400,
        height: 300,
        decoration: BoxDecoration(
        
          image: DecorationImage(image: AssetImage("assets/images/check.png"),
          fit: BoxFit.cover,
          )
        ),
        ),
        Text("Yes it is working", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}