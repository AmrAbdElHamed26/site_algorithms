import 'package:flutter/cupertino.dart';

class  BoxComponent extends StatelessWidget {
  const  BoxComponent({Key? key , required this.screenWidth, required this.screenHeight , required this.color , required this.child }) : super(key: key);

  final double screenWidth , screenHeight ;
  final Color color ;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(15.0),

      ),
      child:child ,
    );
  }
}
