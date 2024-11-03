import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Editprofilescreen extends StatefulWidget {
  const Editprofilescreen({super.key});

  @override
  State<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends State<Editprofilescreen> {

    final namecontroller =TextEditingController();
    final studentnumbercontroller =TextEditingController();
    final rollnumbercontroller =TextEditingController();
    final branchcontroller =TextEditingController();
    final sectioncontroller =TextEditingController();
    final skillscontroller =TextEditingController();
    final gendercontroller =TextEditingController();

    final databaseref = FirebaseDatabase.instance.ref('name');

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


                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  40.0),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),


                          Text("Name"),
                          TextFormField(
                            controller: namecontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                            ),
                          ),
                          
                          Text("Student Number"),
                          TextFormField(
                            controller: studentnumbercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Your Stundent Number",
                            ),
                          ),

                          Text("Roll Number"),
                          TextFormField(
                            controller: rollnumbercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Your Roll Number",
                            ),
                          ),

                          Text("Branch"),
                          TextFormField(
                            controller: branchcontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Your Branch Name",
                            ),
                          ),

                           Text("Section"),
                          TextFormField(
                            controller: sectioncontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Your Section",
                            ),
                          ),

                           Text("Skills"),
                          TextFormField(
                            controller: skillscontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Add Your Skills",
                            ),
                          ),


                           Text("Gender"),
                          TextFormField(
                            controller: gendercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Your Gender",
                            ),
                          ),
                  
                  
                    ],
                  ),
                ),




      ),
    );
  }
}