import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/ui/codeverification.dart';
import 'package:infotrack/utils/utils.dart';

class Phonenumberscreen extends StatefulWidget {
  const Phonenumberscreen({super.key});

  @override
  State<Phonenumberscreen> createState() => _PhonenumberscreenState();
}

class _PhonenumberscreenState extends State<Phonenumberscreen> {

  final phonenumbercontroller = TextEditingController();

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110.0),
          child: Text("Login "),
        ),
       backgroundColor: Colors.blueGrey,
       
       ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
                Column(
                  children: [
                    Text("Enter your phone number",style: TextStyle(fontSize: 28),),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                 children: [
                  TextFormField(
                    controller: phonenumbercontroller,
                    decoration: InputDecoration(
                      hintText: "+91 000 000 0000",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    
                  ),
                 ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {


                        auth.verifyPhoneNumber(

                          phoneNumber: phonenumbercontroller.text,

                          verificationCompleted: (nothing){


                          },

                          verificationFailed: (errora){
                            utils().toastMessage(errora.toString());
                          },

                          codeSent: (String verificationId ,int? code){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Codeverification(verificationId: verificationId,)));

                          },

                          codeAutoRetrievalTimeout: (errora){
                            utils().toastMessage(errora.toString());
                          }
                          
                          );

                      },
                      child: Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Login",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),),
                          ],
                        ),
                      ),
                      
                      ),
                    ),
                  ],
                ),
          
          
            ],
          ),
        ),
      ),

    );
  }
}