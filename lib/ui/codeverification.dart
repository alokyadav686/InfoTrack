import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';
import 'package:infotrack/utils/utils.dart';

class Codeverification extends StatefulWidget {
  final String verificationId;
  const Codeverification({super.key, required this.verificationId});

  @override
  State<Codeverification> createState() => _CodeverificationState();
}

class _CodeverificationState extends State<Codeverification> {

  final verificationcodecontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [Colors.blueAccent,Colors.deepPurpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                  Column(
                    children: [
                      Text("Enter your phone number",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                   children: [
                    TextFormField(
                      // controller: phonenumbercontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "+91 000 000 0000",
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.phone,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      
                    ),
                   ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Login",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.deepPurple),),
                          ],
                        ),
                      ),
                      
                      ),
                      SizedBox(height: 20,),
                     ],
                  ),
            
            
              ],
            ),
          ),
        ),
      ),

    );
  }
}