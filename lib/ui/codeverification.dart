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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
                SizedBox(
                  height: 30,
                ),
                Column(
                 children: [
                  TextFormField(
                    controller: verificationcodecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "6 digit code",
                      prefixIcon: Icon(Icons.phone),
                      errorText: verificationcodecontroller.text.length != 6 ? "Invalid code" : null,
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
                      onTap: ()async {

                        final crr = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId, 
                          smsCode: verificationcodecontroller.text.toString());

                        try{

                            // await auth.signInWithCredential(crr);
                            
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));

                        }catch(e){

                          utils().toastMessage(e.toString());

                        }
                      

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
                            Text("Verify",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),),
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