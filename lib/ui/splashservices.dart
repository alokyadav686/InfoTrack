import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';
import 'package:infotrack/ui/loginscreen.dart';

class Splashservices {
  
  void islogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user!= null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));

    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    }
    
  }

}