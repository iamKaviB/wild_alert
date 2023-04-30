import 'package:flutter/material.dart';
import 'package:pharma/screens/LoginScreen.dart';
import 'package:pharma/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharma',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: LoginScreen(),
    );
  }
}
