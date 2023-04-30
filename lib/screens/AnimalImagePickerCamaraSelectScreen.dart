import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/pages/camara_page.dart';
import 'package:pharma/screens/AnimalAddScreen.dart';

import '../config/AppConfig.dart';
import 'dart:io';

class AnimalImagePickerCamaraSelectScreen extends StatelessWidget {
  const AnimalImagePickerCamaraSelectScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.secondary,
        elevation: 3,
        title: Text(
          "Select your choice",
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraPage()));
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Take a photo'),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary, // set the background color here
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: (){
                  _pickImage().then((value) {
                      if(value != "null"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimalAddScreen(prescriptionImage: File(value),)));
                      }else{

                      }
                  });
                },
                icon: Icon(Icons.folder),
                label: Text('Choose a photo'),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary, // set the background color here
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future<String> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }else{
      return "null";
    }
  }
}
