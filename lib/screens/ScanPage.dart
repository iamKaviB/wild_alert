import 'package:image_picker/image_picker.dart';
import 'package:pharma/data/json.dart';
import 'package:pharma/screens/AnimalImagePickerCamaraSelectScreen.dart';
import 'package:pharma/widgets/avatar_image.dart';
import 'package:pharma/widgets/IconButtion.dart';
import 'package:pharma/widgets/InfoCardWidget.dart';
import 'package:flutter/material.dart';


import '../pages/camara_page.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({ Key? key }) : super(key: key);

  @override
  _AnimalScanScreen createState() => _AnimalScanScreen();
}

class _AnimalScanScreen extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Scan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
      ),
      body: getBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upload images", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(height: 5),
                  Text("make sure to take pictures on clean background", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> TextPrescriptionScreen()));
                },
                child:         Image.network(
                  "https://lp-cms-production.imgix.net/image_browser/leopard-africa-safari.jpg?auto=format&q=75",
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height / 5,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https://wildlifesos.org/wp-content/uploads/2022/09/SURYODAY_ELEPHANT_SURAJ-1800x900.jpg",
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height / 5,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButtion(
                icon: Icons.camera_alt_rounded,
                color: Colors.blue,
                toWidget: Container(
                  height: 300,
                  width: double.infinity,
                  child: AnimalImagePickerCamaraSelectScreen(),
                ),
              ),
            ],
          ),

        ],
      ),
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