import 'package:algorithms_site/core/managers/color_manager.dart';
import 'package:flutter/cupertino.dart';

import '../managers/font_manger.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({Key? key, required this.data,this.isBold = false, this.color = ColorManager.primaryLightTextColor}) : super(key: key);

  final String data;
  final bool isBold ;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return Text(data , style:TextStyle(
      fontSize: FontSize.s16,
      fontWeight: isBold == true ? FontWeightManager.bold :FontWeightManager.medium,
      color : color
    ),);
  }
}
