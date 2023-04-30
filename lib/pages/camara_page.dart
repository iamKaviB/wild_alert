import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:http/http.dart' as http;

import '../screens/AnimalAddScreen.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.yellow,
      onImageCaptured: (value) {
        final path = value.path;
        print("::::::::::::::::::::::::::::::::: $path");
        if (path.contains('.jpg')) {
          showDialog(
              context: context,
              builder: (context) {
                // return AlertDialog(
                //   content: Image.file(File(path)),
                // );
                return AlertDialog (
                  title: Text("Your selected image"),
                  content: Image.file(File(path)),
                  actions: [
                    // Cancel Button
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        // Close the Dialog
                        Navigator.of(context).pop();
                      },
                    ),
                    // Confirm Button
                    TextButton(
                      child: Text("Confirm"),
                      onPressed: () async {
                        // Do something when confirm button is pressed
                        // Close the Dialog
                        // await _sendImage(File(path));
                        Navigator.of(context).pop();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AnimalAddScreen(prescriptionImage: File(path)),));
                      },
                    ),
                  ],
                );
              });
        }
      },
      // onVideoRecorded: (value) {
      //   final path = value.path;
      //   print('::::::::::::::::::::::::;; dkdkkd $path');
      //
      //   ///Show video preview .mp4
      // },
    );
  }




  Future<void> _sendImage(File image) async {
    final url = 'http://localhost:8000/phama/upload_prescription';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    final file = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(file);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded!');
    } else {
      print('Error uploading image: ${response.statusCode}');
    }
  }

}
