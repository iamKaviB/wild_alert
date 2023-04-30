
import 'package:flutter/material.dart';

class IconButtion extends StatelessWidget {
  IconButtion({ Key? key, required this.icon, required this.color , required this.toWidget}) : super(key: key);
  IconData icon;
  Color color;
  Widget toWidget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => toWidget));
      },
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Icon(icon, color: color, size: 25,),
      ),
    );
  }
}