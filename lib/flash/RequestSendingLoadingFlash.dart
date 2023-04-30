import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma/config/AppConfig.dart';

class RequestSendingLoadingFlash extends StatelessWidget {
  const RequestSendingLoadingFlash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // add this line
              children: [
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Center(
                      child: Lottie.network(
                          "${Animations.loadingImage}"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Center(
                      child: Lottie.network(
                          "${Animations.loadingDots}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
