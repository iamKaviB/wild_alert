import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharma/config/AppConfig.dart';
import 'package:pharma/screens/ScanPage.dart';
import 'package:pharma/widgets/ToastWidget.dart';
import 'package:pharma/widgets/FormTextInputWidget.dart';

import '../flash/RequestSendingLoadingFlash.dart';
import '../theme/colors.dart';
import '../util/Utill.dart';
import '../widgets/mybutton.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  var emailValidationController = TextEditingController();
  var passwordValidationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Util.getScreenHeight(context),
        width: Util.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Util.getTheme(context).headline6,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage(
                      "assets/logo.jpg"
                    ),
                  ),
                ),
                Text('Add your details to login'),
                Spacer(),
                FormTextInputWidget(
                  hint: "Your email",
                  textEditingController: emailValidationController,
                ),
                SizedBox(
                  height: 20,
                ),
                FormTextInputWidget(
                  hint: "Password",
                  textEditingController: passwordValidationController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MyButton(
                    onTap: () {
                      login(context);
                    },
                    bgColor: AppColor.secondary,
                    icon: Icons.login,
                    disableButton: false,
                    title: "Login",
                    height: 30,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: RequestSendingLoadingFlash(),
                        );
                      },
                    );

                    Future.delayed(Duration(seconds: 1), () {

                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    var email = emailValidationController.text.trim();
    var password = passwordValidationController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      // show error toast
      print("please fill email and password");
      return;
    }

      if (email == "admin@admin.com" && password == "admin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScanScreen()));
      }

  }
}
