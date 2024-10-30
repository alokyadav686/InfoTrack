import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';
import 'package:infotrack/ui/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infotrack/utils/utils.dart'; 


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

final _formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();

final _auth = FirebaseAuth.instance;



@override
void dispose(){
  super.dispose();
  emailController.dispose();
  passwordController.dispose();
  

}

void login(){

  _auth.signInWithEmailAndPassword(
    email: emailController.text.toString(), 
    password: passwordController.text.toString()).then((value){
      utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));

    }).onError((error, stackTrace){
      utils().toastMessage(error.toString());

    });
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:  false,
        title: Center(child: Text("InfoTrack")),
       backgroundColor: Colors.blueGrey,
       
       ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                
                child: Column(
                  children: [
                    
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),

                  validator: (value){
                      if(value!.isEmpty){
                        return 'Enter email';
                      }
                      else{
                        return null;
                      }
                  },
                ),
          
                  SizedBox(height: 10,),
                 TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                  validator: (value){
                      if(value!.isEmpty){
                        return "Enter password";
                      }
                      else{
                        return null;
                      }
                  },
                ),

                  ],
              )),

                  SizedBox(height: 40,),

              InkWell(
                onTap: ()=>{

                    if(_formKey.currentState!.validate()){

                      login(), 
                      print("everything is filled"),
                      
                    },
                },
                child: Container(
                  width: double.infinity,
                  height: 35,
                  
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Signupscreen()));
              }, 
              
              child: 
                Text("Sign Up"),
              )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}