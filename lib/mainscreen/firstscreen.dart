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
            Text("Sapna", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            
            Container(width: 400,
        height: 300,
        decoration: BoxDecoration(
        
          image: DecorationImage(image: AssetImage("assets/images/sapna.jpg"),
          fit: BoxFit.cover,
          )
        ),
        ),
        Text("Yes I am Moti", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}