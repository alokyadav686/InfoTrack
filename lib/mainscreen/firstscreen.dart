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
      body: Column(children: [Container(width: 100,
      height: 200,
      color: Colors.red,)],),
    );
  }
}