import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infotrack/ui/codeverification.dart';
import 'package:infotrack/ui/loginscreen.dart';
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
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 110.0),
      //     child: Text("Login "),
      //   ),
      //  backgroundColor: Colors.blueGrey,
       
      //  ),


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
                      controller: phonenumbercontroller,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "+91 000 000 0000",
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.phone,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
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
        
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Codeverification(verificationId: verificationId,)));
        
                            },
        
                            codeAutoRetrievalTimeout: (errora){
                              utils().toastMessage(errora.toString());
                            }
                            
                            );
        
                        },
                        child: Container(
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
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Text("or",style: TextStyle(color: Colors.white,fontSize: 16),),
                          SizedBox(height: 20,),

                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                            },
                            child: Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: 
                                [Colors.orangeAccent,Colors.redAccent],
                                
                                ),
                                borderRadius: BorderRadius.circular(15)
                                
                              ),
                              child: Center(
                                child: Text("Continue with Email",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),),
                              ))),
                        ],
                      )
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