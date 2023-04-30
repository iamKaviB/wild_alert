import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget{

  static void showToast(message , length , gravity , backgroundColor , textColor){
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0
    );
  }

}