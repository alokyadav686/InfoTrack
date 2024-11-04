import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infotrack/mainscreen/aboutscreen.dart';
import 'package:infotrack/mainscreen/editprofilescreen.dart';
import 'package:infotrack/mainscreen/firstscreen.dart';
import 'package:infotrack/ui/loginscreen.dart';
import 'package:infotrack/utils/utils.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final firestore = FirebaseFirestore.instance.collection("user").snapshots();
  final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 30,),

              Text("Profile",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),


              SizedBox(height: 30,),

                    Expanded(
                child: Container(
                  height: 800,
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Center(
                    child: Column(
                      children: [
                        
                        StreamBuilder<QuerySnapshot>(
                          stream: firestore,
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            
                            if (snapshot.hasError) {
                              return Text("Some Error");
                            }
                            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                              return Text("No Data Available");
                            }
                
                            var userDoc = snapshot.data!.docs[0];

                      return Column(
                        children: [
                          ProfileSection(title: "Name : ", value: userDoc['name']),
                          ProfileSection(title: "Student ID : ", value: userDoc['student id']),
                          ProfileSection(title: "Roll Number : ", value: userDoc['roll number']),
                          ProfileSection(title: "Branch : ", value: userDoc['branch']),
                          ProfileSection(title: "Section : ", value: userDoc['section']),
                          ProfileSection(title: "Skills : ", value: userDoc['skills']),
                          ProfileSection(title: "Gender : ", value: userDoc['gender']),
                        ],
                      );

                          },
                        ),
                
                        
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),
              Column(
                children: [


                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Editprofilescreen()));
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30)
                            ),
                            
                            child: Center(child: Text("Edit Profile", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blueAccent),)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            auth.signOut().then((value){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
                            }).onError((error, stackTrace) {
                              utils().toastMessage(error.toString());
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30)
                            ),
                            
                            child: Center(child: Text("Sign Out", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blueAccent),)),
                          ),
                        ),
                        SizedBox(height: 20,),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Firstscreen()));
                              },
                              child: Container(
                                width: 60,
                                height: 52,
                                child: Column(
                                  children: [
                                    Icon(Icons.home_outlined,color: Colors.white,),
                                    Text("Home", style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutscreen()));
                              },
                              child: Container(
                                width: 60,
                                height: 52,
                                child: Column(
                                  children: [
                                    Icon(Icons.info_outline_rounded,color: Colors.white,),
                                    Text("About", style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () {
                
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => Profilescreen()));
                              },
                              child: Container(
                                width: 60,
                                height: 52,
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
            ],
          ),
        ),
      ),
    );
  }

  
}

class ProfileSection extends StatefulWidget {
  final String title;
  final String value;

  const ProfileSection({super.key,required this.title,required this.value});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
      child: Row(

        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Text(
            widget.value,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
        
      ),
    );
  }
}
