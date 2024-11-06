import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/main.dart';
import 'package:infotrack/mainscreen/aboutscreen.dart';
import 'package:infotrack/mainscreen/editprofilescreen.dart';
import 'package:infotrack/mainscreen/profilescreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {

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
            end: Alignment.bottomRight,)
          
        ),
        child: Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, bottom: 30),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/splashbg1.png"),
                fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.deepPurpleAccent)
              // color: Colors.red,
              ),
            
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Expanded(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: 
                  [
                    Colors.deepPurpleAccent, Colors.blueAccent
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                  )
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Welcome to InfoTrack!",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white70,),
                        textAlign: TextAlign.justify,
                        ),
                        
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text("Your go-to app for tracking information seamlessly. Explore the features we offer.",style: TextStyle(fontSize: 16,color: Colors.white70),
                        textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Editprofilescreen()));
                        },
                        child: Container(
                          height: 50,
                          color: Colors.white60,
                          child: Center(child: Text("Setup Your Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Spacer(),
          Container(
            
            height: 60,
            width: double.infinity,
            color: Colors.white12,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));
                        },
                        child: Container(
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.home_outlined,color: Colors.white,),
                              Text("Home",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Aboutscreen()));
                        },
                        child: Container(
                        
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.info_outline_rounded,color: Colors.white,),
                              Text("About",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profilescreen()));
                        },
                        child: Container(
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.account_circle_outlined,color: Colors.white,),
                              Text("Profile",style: TextStyle(color: Colors.white),),
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
    
      ],
    ),

    ),

    

      ),
      
    );
  }
}