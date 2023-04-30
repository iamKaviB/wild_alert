import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/screens/ScanPage.dart';
import 'package:audioplayers/audioplayers.dart';



import '../util/Utill.dart';
import '../widgets/mybutton.dart';

class AnimalAddScreen extends StatefulWidget {

  final File prescriptionImage;

  const AnimalAddScreen({Key? key, required this.prescriptionImage}) : super(key: key);

  @override
  State<AnimalAddScreen> createState() =>
      _AnimalAddScreenState();
}

class _AnimalAddScreenState extends State<AnimalAddScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController prescriptionTitle = new TextEditingController();
  TextEditingController doctorNameController = new TextEditingController();
  TextEditingController drugText = new TextEditingController();
  var prediction = "";
  var description="";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
    });

    uploadImage(widget.prescriptionImage).then((value) {

      setState(() {
        prediction = value;
        isLoading = false;
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Result",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text("Result :" +prediction ,
              style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Text(description ,
              style: TextStyle(color: Colors.black, fontSize: 20)),
          SizedBox(
            height: 25,
          ),
          Divider(),

          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Image.file(widget.prescriptionImage ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: MyButton(
                      width: double.maxFinite,
                      disableButton: false,
                      bgColor: Colors.redAccent,
                      title: "Back to Home",
                      icon: Icons.arrow_back,
                      onTap: () {
                        cleanData();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanScreen()));
                      }),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: MyButton(
                      width: double.maxFinite,
                      disableButton: false,
                      bgColor: Colors.green,
                      title: "Save",
                      icon: Icons.save_alt,
                      onTap: () {

                          //TODO save method
                          // List<dynamic> list2 = [...drugList];
                          // String? userId = auth.currentUser?.uid;
                          // Future savedPrescription = ImagePrescriptionService()
                          //     .addImagePrescription(userId, prescriptionTitle.text,
                          //         doctorNameController.text, list2, widget.prescriptionImage);

                          // if (savedPrescription != null) {
                          //   ToastWidget.showToast(
                          //       "Your prescription saved and send to the network",
                          //       Toast.LENGTH_LONG,
                          //       ToastGravity.BOTTOM,
                          //       Colors.green,
                          //       Colors.black);
                          //
                          //   // clean all the text fields
                          // cleanData();
                          // } else {
                          //   ToastWidget.showToast(
                          //       "Something went wrong",
                          //       Toast.LENGTH_SHORT,
                          //       ToastGravity.BOTTOM,
                          //       Colors.redAccent,
                          //       Colors.black);
                          // }

                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  void cleanData() {
    setState(() {
      prediction = "";
      prescriptionTitle.text = "";
      doctorNameController.text = "";
      widget.prescriptionImage;
    });
  }


  Future<String> uploadImage(File imageFile) async {
    // Define the endpoint URL

    final String url = "http:/127.0.0.1/8000/upload_image";

    // Create a new multipart request
    var request = http.MultipartRequest("POST", Uri.parse(url));

    // Add the image file to the request
    var image = await http.MultipartFile.fromPath("image", imageFile.path);
    request.files.add(image);

    // Send the request and get the response
    var response = await request.send();
    var responseData = await response.stream.toBytes();

    // Decode the response data as a map
    Map<String, dynamic> responseMap = json.decode(utf8.decode(responseData));

    // Extract the prescription value from the map
    String prediction = responseMap["prediction"];

    if(prediction.contains("leopard") || prediction.contains("elephant")){
      final player = AudioCache();

// Play the alert beep sound
      player.play('beep.mp3');
    }






    // Return the prescription value as a Future<String>
    return Future.value(prediction);
  }




}
