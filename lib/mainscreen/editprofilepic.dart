import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infotrack/utils/utils.dart';

class Editprofilepic extends StatefulWidget {
  const Editprofilepic({super.key});

  @override
  State<Editprofilepic> createState() => _EditprofilepicState();
}

class _EditprofilepicState extends State<Editprofilepic> {

  File? _image;
  final picker = ImagePicker();

  Future getgalleryImage() async{
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      

    if (pickedfile!= null){
        _image = File(pickedfile.path);
    }
    else{
      utils().toastMessage("please pick a file");
    }
    });
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            InkWell(
              onTap: () {
                getgalleryImage();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                // color: Colors.amber,
                  border: Border.all(color: Colors.black)
                ),
                child: _image !=null? Image.file(_image!.absolute): Icon(Icons.image),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap:() {
                Navigator.pop(context);
                
              },
              child: Container(
                  height: 30,
                  width: 100,
                  color: Colors.white60,
                child: Center(child: Text("Upload Image"))),
            ),
        
          ],
        ),
      ),

    );
  }
}