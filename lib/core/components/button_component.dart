import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({Key? key, required this.width, required this.height , required this.buttonName}) : super(key: key);

  final double width, height;
final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set the border radius as needed
        border: Border.all(
          color: Colors.black,
          width: 2.0, // Set the border width as needed
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
