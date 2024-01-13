import 'package:flutter/cupertino.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({
    Key? key,
    required this.iconData,
    required this.color,
    this.size = 22,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
