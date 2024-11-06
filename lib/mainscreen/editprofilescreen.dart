import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
    // final branchcontroller =TextEditingController();
    // final sectioncontroller =TextEditingController();
    final skillscontroller =TextEditingController();
    // final gendercontroller =TextEditingController();

    String selectedskill = 'Skills';
    bool isOpen=false;

    _EditprofilescreenState(){
      selectedbranch=branchdrop[0];
      selectedsec=sectiomdrop[0];
      selectedgender=genderdrop[0];

    }

    
    
    

    // final databaseref = FirebaseDatabase.instance.ref('name');

    savechanges(String name, String stid, String rollnum, String branch, String sec, String skill, String gen,)async{
      if (name.isEmpty || stid.isEmpty || rollnum.isEmpty || branch.isEmpty || sec.isEmpty || skill.isEmpty || gen.isEmpty) {
            utils().toastMessage("Enter all fields");
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
            utils().toastMessage("Changes Saved");
            Navigator.pop(context);
        });
      }
    }

    final branchdrop = [
      'CSIT',
      'CSE',
      'IT',
      'CSE(DS)',
      'CSE(AIML)',
      'OTHERS',
    ];
    final sectiomdrop=[
      '1',
      '2',
      '3',
      '4',
    ];

    final genderdrop=[
      'Male',
      'Female',
      'Others',
      
    ];  
    String? selectedbranch='';
    String? selectedsec='';
    String? selectedgender='';

    final validatorkey = GlobalKey<FormState>();



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

                        Form(

                          key: validatorkey,

                          child: Container(
                            width: double.infinity,
                            child: Text("Edit Profile", 
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white))),
                        ),

                          // Text("Name"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: namecontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Name",
                              
                              hintStyle: TextStyle(color: Colors.white),
                              
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                                            

                              ),
                              
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter your Name";
                              }
                              else{
                                return null;
                              }
                            },
                          ),

                          
                          // Text("Student Number"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: studentnumbercontroller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            
                            decoration: InputDecoration(
                              hintText: "Student Number",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter Student ID";

                              }
                              else{
                                return null;
                              }
                            },
                          ),

                          // Text("Roll Number"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: rollnumbercontroller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],

                            
                            
                            decoration: InputDecoration(
                              hintText: "Roll Number",


                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value){
                              if (value!.isEmpty){
                                return "enter roll number";
                              }
                              else{
                                return null;

                              }
                            },
                          ),

                          // Text("Branch"),
                          SizedBox(height: 20),
                          // TextFormField(
                          //   controller: branchcontroller,
                          //   keyboardType: TextInputType.text,
                            
                          //   decoration: InputDecoration(
                          //     hintText: "Branch ",
                          //     hintStyle: TextStyle(color: Colors.white),
                          //     hintFadeDuration: Duration(microseconds: 20),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(8),

                          //     ),
                          //   ),
                          // ),
                          DropdownButtonFormField(
                            
                            value: selectedbranch,
                            items: branchdrop.map(
                            (i) {
                              return DropdownMenuItem(child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(i,style: TextStyle(fontSize: 16,color: Colors.white),),
                              ),value: i,);
                            }
                          ).toList(),
                          
                          
                           onChanged: (val){
                              setState(() {
                                selectedbranch =val as String;
                                
                              });

                          },
                            icon:Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                            dropdownColor: Colors.blueAccent,
                            decoration: InputDecoration(
                                                           
                              // hintText: "Branch",
                              label: Text("Branch",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                          ),

                          //  Text("Section"),
                          SizedBox(height: 20),
                          // TextFormField(
                          //   controller: sectioncontroller,
                          //   keyboardType: TextInputType.number,
                          //   decoration: InputDecoration(
                          //     hintText: "Section",
                          //     hintStyle: TextStyle(color: Colors.white),
                          //     hintFadeDuration: Duration(microseconds: 20),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(8),

                          //     ),
                          //   ),
                          // ),

                          DropdownButtonFormField(
                            
                            value: selectedsec,
                            items: sectiomdrop.map(
                            (i) {
                              return DropdownMenuItem(child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(i,style: TextStyle(fontSize: 16,color: Colors.white),),
                              ),value: i,);
                            }
                          ).toList(),
                          
                          
                           onChanged: (val){
                              setState(() {
                                selectedsec =val as String;
                                
                              });

                          },
                            icon:Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                            dropdownColor: Colors.blueAccent,
                            decoration: InputDecoration(
                                                           
                              // hintText: "Branch",
                              label: Text("Section",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                          ),


                          //  Text("Skills"),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: skillscontroller,
                            keyboardType: TextInputType.text,
                            
                            decoration: InputDecoration(
                              
                              hintText: "Skills",
                              hintStyle: TextStyle(color: Colors.white),
                              hintFadeDuration: Duration(microseconds: 20),
                              border: OutlineInputBorder(
                              
                                borderRadius: BorderRadius.circular(8),

                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10,),

                          // InkWell(
                          //   onTap: () {
                          //     isOpen=!isOpen;
                          //     setState(() {
                          //     // isOpen=true;
                                
                          //     });
                          //   },
                          //   child: Container(
                          //     width: 150,
                          //     height: 50,
                          //     decoration: BoxDecoration(
                          //     // color: Colors.white70,
                          //     border: Border.all(color: Colors.brown.shade400),
                          //     borderRadius: BorderRadius.circular(8),
                              
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(selectedskill,style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w500),),
                          //           Icon(isOpen? Icons.arrow_drop_up_sharp :  Icons.arrow_drop_down_sharp,color: Colors.white,)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // if(isOpen)
                          // ListView(
                          //   primary: true,
                          //   shrinkWrap: true,
                          //   children: skilsdrop.map((e)=>Container(
                          //      decoration: BoxDecoration(
                          //     // color: Colors.white70,
                          //     color:selectedskill==e ? Colors.white54 : Colors.white12,
                          //     // borderRadius: BorderRadius.circular(8),
                              
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2),
                          //       child: InkWell(
                          //           onTap: () {
                          //             selectedskill=e;
                          //             isOpen=false;
                          //             setState(() {
                                        
                          //             });
                          //           },
                          //         child: Text(e)),
                          //     ),
                          //   )).toList(),
                          // ),
                          

                          // DropdownButton(
                          //   value: selectedbranch,
                          //   items: branchdrop.map(
                          //   (i) {
                          //     return DropdownMenuItem(child: Text(i),value: i,);
                          //   }
                          // ).toList(),
                          
                          
                          //  onChanged: (val){
                          //     setState(() {
                          //       selectedbranch =val as String;
                          //     });
                          // }),


                          //  Text("Gender"),
                          SizedBox(height: 20),
                          // TextFormField(
                          //   controller: gendercontroller,
                          //   keyboardType: TextInputType.text,
                            
                          //   decoration: InputDecoration(
                          //     hintText: "Gender",
                          //     hintStyle: TextStyle(color: Colors.white),
                          //     hintFadeDuration: Duration(microseconds: 20),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(8),

                          //     ),
                          //   ),
                          // ),
                          DropdownButtonFormField(
                            
                            value: selectedgender,
                            items: genderdrop.map(
                            (i) {
                              return DropdownMenuItem(child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(i,style: TextStyle(fontSize: 16,color: Colors.white),),
                              ),value: i,);
                            }
                          ).toList(),
                          
                          
                           onChanged: (val){
                              setState(() {
                                selectedgender =val as String;
                                
                              });

                          },
                            icon:Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                            dropdownColor: Colors.blueAccent,
                            decoration: InputDecoration(
                                                           
                              // hintText: "Branch",
                              label: Text("Gender",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
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

                        if(studentnumbercontroller.text.toString().length==7){
                          savechanges(namecontroller.text.toString(), studentnumbercontroller.text.toString(),rollnumbercontroller.text.toString(),selectedbranch.toString(),selectedsec.toString(),skillscontroller.text.toString(),selectedgender.toString());
                        
                        if(validatorkey.currentState!.validate()){
        
                        
                        print("everything is filled");
                        }
                        
                      }
                      else{
                          utils().toastMessage("student number should be of 7 digits");
                          // print(object)
                        }


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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profilescreen()));

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