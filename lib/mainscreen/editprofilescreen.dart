import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infotrack/mainscreen/profilescreen.dart';
import 'package:infotrack/utils/utils.dart';

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

    // final databaseref = FirebaseDatabase.instance.ref('name');

    savechanges(String name, String stid, String rollnum, String branch, String sec, String skill, String gen,)async{
      if(name =="" && stid=='' && rollnum=='' && branch=='' && sec=='' && skill=='' && gen==''){
        print("enter all field");
      }
      else{
        FirebaseFirestore.instance.collection("user").doc("allinfo").set({
          'name': name,
          'student id' : stid,
          'roll number': rollnum,
          'branch': branch,
          'section': sec,
          'skills': skill,
          'gender': gen,


        }).then((value){
            print("inserted");
        });
      }
    }

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
                  padding: const EdgeInsets.symmetric(horizontal:  30.0),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),

                        Container(
                          width: double.infinity,
                          child: Text("Edit Profile", 
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white))),

                          // Text("Name"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: namecontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                                            

                              ),
                            ),
                          ),
                          
                          // Text("Student Number"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: studentnumbercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Student Number",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              
                            ),
                          ),

                          // Text("Roll Number"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: rollnumbercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Roll Number",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                          ),

                          // Text("Branch"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: branchcontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Branch ",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                          ),

                          //  Text("Section"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: sectioncontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Section",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                          ),

                          //  Text("Skills"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: skillscontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Skills",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                          ),
                          
                          

                          //  Text("Gender"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: gendercontroller,
                            
                            decoration: InputDecoration(
                              hintText: "Gender",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                          ),

                          SizedBox(height: 30,),

                          InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofilescreen()));

                        // databaseref.child('1').set({
                        //     'title': namecontroller.text.toString(),
                        //     'id': 1,
                        // });
                        savechanges(namecontroller.text.toString(), studentnumbercontroller.text.toString(),rollnumbercontroller.text.toString(),branchcontroller.text.toString(),sectioncontroller.text.toString(),skillscontroller.text.toString(),gendercontroller.text.toString());
                        utils().toastMessage("Changes Saved");
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8)

                        ),
                        child: Center(child: Text("Save Changes",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.blueAccent),)),
                      ),
                    ),

                    SizedBox(height: 30,),
                       InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilescreen()));

                      },
                      child: Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8)

                        ),
                        child: Center(child: Text("Go to profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent),)),
                      ),
                    ),
                  
                  
                    ],
                  ),
                ),




      ),
    );
  }
}