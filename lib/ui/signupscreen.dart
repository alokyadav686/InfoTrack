import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/ui/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

final _formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();

FirebaseAuth _auth = FirebaseAuth.instance;

@override
void dispose(){
  
  emailController.dispose();
  passwordController.dispose();
  confirmpasswordController.dispose();
  // super.dispose();

}

class _SignupscreenState extends State<Signupscreen> {
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
                    // suffixIcon: Icon(Icons.remove_red_eye_outlined),
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

                  SizedBox(height: 10,),
                 TextFormField(
                  keyboardType: TextInputType.text,
                  controller: confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                  validator: (value){
                      if(value!.isEmpty){
                          return "enter confirm password";
                      }
                     else if(value!=passwordController.text) {
                        return "Passwords do not match";
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
                      _auth.createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                       password: passwordController.text.toString())

                    }
                  
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
                        Text("Sign Up", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(fontSize: 15),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginscreen()));
              }, 
              
              child: 
                Text("Login"),
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