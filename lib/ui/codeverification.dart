import 'package:flutter/material.dart';

class Codeverification extends StatefulWidget {
  final String verificationId;
  const Codeverification({super.key, required this.verificationId});

  @override
  State<Codeverification> createState() => _CodeverificationState();
}

class _CodeverificationState extends State<Codeverification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        color: Colors.amber,
      ),
    );
  }
}