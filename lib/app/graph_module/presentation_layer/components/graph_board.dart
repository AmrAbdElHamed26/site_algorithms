import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/algorithms/graph_algorithms/graph_algorithms.dart';
import '../../../../core/components/box_comonent.dart';
import '../../../../core/components/button_component.dart';
import '../controller/graph_board_bloc.dart';
import '../controller/graph_board_state.dart';
import '../screens/graph_painter.dart';

Map<String, Offset> nodePositions = {};
Map<String , Offset> lastOffset = {};
List<String>path= [];
class GraphBoard extends StatefulWidget {
  const GraphBoard({Key? key}) : super(key: key);

  @override
  _GraphBoardState createState() => _GraphBoardState();
}

class _GraphBoardState extends State<GraphBoard> {
  bool isMouseHoveredOnDFSButton = false;

@override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    if (nodePositions.isNotEmpty && lastOffset.isNotEmpty) {
      nodePositions.forEach((key, value) {
        var dxDiff = screenWidth - lastOffset[key]!.dx;
        var dyDiff = screenHeight - lastOffset[key]!.dy;

        if (value.dx + (dxDiff) >= 33 &&
            value.dx + (dxDiff) <= 1042 &&
            value.dy + (dyDiff) >= 37&&
            value.dy + (dyDiff) <= 530) {
          nodePositions[key] = Offset(value.dx + (dxDiff), value.dy + (dyDiff));
        }

      });


    }


    return BlocBuilder<GraphBoardBloc, GraphBoardState>(
      builder: (context, state) {
       if(nodePositions.isNotEmpty){
         nodePositions.forEach((key, value) {
           lastOffset.addAll({key: Offset(screenWidth, screenHeight)});
         });
       }

        return Padding(
          padding: const EdgeInsets.only(top:30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxComponent(
                screenHeight: screenSize.height * .75,
                screenWidth: screenSize.width * .7,
                color: Colors.black,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.localPosition.dx >= 33 &&
                        details.localPosition.dx <= 1042 &&
                        details.localPosition.dy >= 37&&
                        details.localPosition.dy <= 530) {
                      setState(() {
                        updateNodePosition(details);
                      });
                    }
                  },
                  child: CustomPaint(
                    painter: GraphPainter(
                      state.allNodes,
                      screenSize.height * .75,
                      screenSize.width * .7,
                    ),
                  ),
                ),

              ),
              /// buttons for graph

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: max(screenWidth * .07, 15),
                    ),

                    GestureDetector(
                      onTap: () {
                        path.removeRange(0,path.length);
                        List<String> tmpPath = GraphAlgorithms().findPathUsingDFS('1', state.allNodes!);

                        int currentIndex = 0;

                        Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (currentIndex < tmpPath.length) {
                            path.add(tmpPath[currentIndex]);
                            currentIndex++;
                            setState(() {

                            });
                          } else {
                            timer.cancel();
                          }
                        });


                      },
                      child: ButtonComponent(
                        width: max(screenWidth * .06, 60),
                        height: screenHeight * .05,
                        buttonName: "DFS",
                      ),
                    ),

                    SizedBox(
                      width: max(screenWidth * .07, 15),
                    ),
                    GestureDetector(
                      onTap: (){
                        path.removeRange(0,path.length);
                        List<String> tmpPath = GraphAlgorithms().findPathUsingBFS('1', state.allNodes!);

                        int currentIndex = 0;

                        Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (currentIndex < tmpPath.length) {
                            path.add(tmpPath[currentIndex]);
                            currentIndex++;
                            setState(() {

                            });
                          } else {
                            timer.cancel();
                          }
                        });
                      },
                      child: ButtonComponent(
                          width: max(screenWidth * .06 , 60),

                          height: screenHeight * .05,
                          buttonName: "BFS"),
                    ),
                    SizedBox(
                      width: max(screenWidth * .07, 15),
                    ),

                    GestureDetector(
                      onTap: (){
                        path.removeRange(0,path.length);
                        List<String> tmpPath = GraphAlgorithms().findPathUsingDijkstra('1', state.allNodes!);

                        int currentIndex = 0;

                        Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (currentIndex < tmpPath.length) {
                            path.add(tmpPath[currentIndex]);
                            currentIndex++;
                            setState(() {

                            });
                          } else {
                            timer.cancel();
                          }
                        });
                      },
                      child: ButtonComponent(

                          width: max(screenWidth * .06 , 60),

                          height: screenHeight * .05,
                          buttonName: "Dijkstra"),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void updateNodePosition(DragUpdateDetails details) {
    nodePositions.forEach((key, position) {
      double distance = (details.localPosition - position).distance ;
      if (distance < 30) {
        nodePositions[key] = position + details.delta;
      }
    });
  }
}

