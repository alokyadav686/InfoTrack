import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';
import 'package:infotrack/ui/phonenumberscreen.dart';
import 'package:infotrack/ui/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infotrack/utils/utils.dart'; 


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}


class _LoginscreenState extends State<Loginscreen> {

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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Firstscreen()));

    }).onError((error, stackTrace){
      utils().toastMessage(error.toString());

    });
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading:  false,
      //   title: Center(child: Text("InfoTrack")),
      //  backgroundColor: Colors.blueGrey,
       
      //  ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
           gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  
                  child: Column(
                    children: [
                      Column(

                        children: [
                          Text("Welcome Back!", style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                           SizedBox(height: 20),
                           Text("Login to your account", style: TextStyle(fontSize: 18,color: Colors.white70),)
                        ],

                        


                      ),
                      SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                      border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                             ),
                          
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
            
                    SizedBox(height: 15,),
                   TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                      border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              
                            ),
                          
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
        
                    SizedBox(height: 30,),
        
                InkWell(
                  onTap: ()=>{
        
                      if(_formKey.currentState!.validate()){
        
                        login(), 
                        print("everything is filled"),
                        
                      },
                  },
                  child: Container(
                    width: 150,
                    height: 45,
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.deepPurple),),
                        ],
                      ),
                    ),
                  ),
                ),
        
                SizedBox(height: 20,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.white,),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Signupscreen()));
                }, 
                
                child: 
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
        
                  ],
                ),
        
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or", style: TextStyle(color: Colors.white,)),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                   InkWell(
                  onTap: ()=>{
        
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Phonenumberscreen()))
        
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    
                    decoration: BoxDecoration(
                      // color: Colors.blueGrey,
                      gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.redAccent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Colors.blueGrey)

                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login with Phone", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white),),
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
      ),
    );
  }
}