import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/aboutscreen.dart';
import 'package:infotrack/mainscreen/editprofilescreen.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
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

        Container(
                    
          child: Center(
            child: Column(
             
                children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.white30,

                    ),
                    Text("Name"),
                    Text("Name"),
                    Text("Name"),
                    Text("Name"),
                    Text("Name"),
                    Text("Name"),
                    Text("Name"),

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofilescreen()));
                      },
                      child: Container(
                        height: 35,
                        width: 100,
                        color: Colors.white,
                        child: Center(child: Text("Edit Profile")),
                      ),
                    ),

                ],
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Firstscreen()));
                        },
                        child: Container(
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.home_outlined),
                              Text("Home"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutscreen()));
                        },
                        child: Container(
                        
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.info_outline_rounded),
                              Text("About"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilescreen()));
                        },
                        child: Container(
                          width: 60,
                          height: 52,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Icon(Icons.account_circle_outlined),
                              Text("Profile"),
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