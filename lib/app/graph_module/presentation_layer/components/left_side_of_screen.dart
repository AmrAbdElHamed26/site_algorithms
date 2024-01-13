import 'package:algorithms_site/app/graph_module/presentation_layer/controller/graph_board_bloc.dart';
import 'package:algorithms_site/core/utils/constances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/box_comonent.dart';

class LeftSideOfGraphScreen extends StatelessWidget {
   LeftSideOfGraphScreen({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController(text: Constances.defaultGraph);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;


    return Column(
        children: [
          BoxComponent(
            screenHeight: screenSize.height * .53,
            screenWidth: screenSize.width * .18,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controller,

                  onChanged: (nodes){
                    ///todo : send add new node event
                    BlocProvider.of<GraphBoardBloc>(context).add(AddNewNodeToGraphEvent(nodes: nodes));
                    //print(value);
                  },
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25,),

        ],);
  }
}
