import 'package:algorithms_site/app/graph_module/presentation_layer/components/graph_board.dart';
import 'package:algorithms_site/app/graph_module/presentation_layer/components/left_side_of_screen.dart';
import 'package:algorithms_site/app/graph_module/presentation_layer/controller/graph_board_bloc.dart';
import 'package:algorithms_site/core/services/services_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constances.dart';


class NodesGraphScreen extends StatelessWidget {
  const NodesGraphScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GraphBoardBloc(getIt())..add(const AddNewNodeToGraphEvent(nodes: Constances.defaultGraph)),
        child: Column(
          children: [

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LeftSideOfGraphScreen(),
      
                /// todo : draw the graph
      
                const GraphBoard(),
      
              ],
            ),
      
      
          ],
        ),
      ),
    );
  }
}
