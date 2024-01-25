import 'package:algorithms_site/core/algorithms/graph_algorithms/graph_algorithms.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/pair.dart';
import 'package:toastification/toastification.dart';

class GraphGridScreen extends StatefulWidget {
  const GraphGridScreen({Key? key}) : super(key: key);

  @override
  _GraphGridScreenState createState() => _GraphGridScreenState();
}

class _GraphGridScreenState extends State<GraphGridScreen> {
  int width = 10, height = 10;
  late List<int> selectedCells;

  Color startButtonColor = Colors.blue;
  Color endButtonColor = Colors.green;
  Color blocksButtonColor = Colors.red;

  bool startButton = true, endButton = false, blocksButton = false;

  int startCell = 0;
  int endCell = 99;
  Map<int, int> blocks = {};

  @override
  void initState() {
    selectedCells = List.generate(width * height, (index) => 0);
    selectedCells[0] = 1;
    selectedCells[99] = 2;
    super.initState();
  }

  Future<void> changeColorWithDelay(List<Pair<int, int>> path) async {
    for (Pair<int, int> cell in path) {
      int index = cell.first * width + cell.second;

      await Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          selectedCells[index] = 4;
        });
      });
    }
  }

  void handleButtonPress(String buttonType) {
    removeYellowColor();

    setState(() {
      startButton = buttonType == 'Start';
      endButton = buttonType == 'End';
      blocksButton = buttonType == 'Blocks';
    });
  }

  Color getColorCell(int index) {
    switch (selectedCells[index]) {
      case 0:
        return Colors.blueGrey;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 4:
        return Colors.yellowAccent;
      default:
        return Colors.red;
    }
  }

  int getValueCell(int index) {
    if (startButton) {
      if (startCell == index && selectedCells[index] != 0) return 0;
      selectedCells[startCell] = 0;
      startCell = index;
      return 1;
    }
    if (endButton) {
      if (endCell == index && selectedCells[index] != 0) return 0;
      selectedCells[endCell] = 0;
      endCell = index;
      return 2;
    }
    if (blocksButton) {
      if (selectedCells[index] == 3) {
        return 0;
      } else {
        return 3;
      }
    }
    return 0;
  }

  List<List<int>> to2D(List<int> flatList, int numRows, int numCols) {
    if (flatList.length != numRows * numCols) {
      throw ArgumentError("Invalid dimensions for 2D conversion");
    }

    List<List<int>> result = [];
    for (int i = 0; i < numRows; i++) {
      result.add(flatList.sublist(i * numCols, (i + 1) * numCols));
    }

    for (int i = 0; i < 10; i++) {
      print(result[i]);
    }
    print("_____________________________________");

    return result;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var containerWidth = screenSize.width * 0.7;
    var containerHeight = screenSize.height * 0.68;

    var cellWidth = containerWidth / width;
    var cellHeight = containerHeight / height;

    return Row(
      children: [
        SizedBox(
          width: screenSize.width * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenSize.height * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleButtonPress('Start');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            return startButton
                                ? startButtonColor
                                : Colors.blue.shade100;
                          },
                        ),
                      ),
                      child: const Text(
                        'Start',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        handleButtonPress('End');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            return endButton
                                ? endButtonColor
                                : Colors.green.shade100;
                          },
                        ),
                      ),
                      child: const Text(
                        'End',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        handleButtonPress('Blocks');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            return blocksButton
                                ? blocksButtonColor
                                : Colors.red.shade100;
                          },
                        ),
                      ),
                      child: const Text(
                        'Blocks',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenSize.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          List<Pair<int, int>> res = GraphAlgorithms()
                              .findPathUsing2dDfs(selectedCells);

                          await changeColorWithDelay(res);
                        } catch (e) {
                          toastification.show(
                            context: context,
                            title: Text(e.toString()),
                            autoCloseDuration: const Duration(seconds: 3),
                            icon: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            return Colors.black26;
                          },
                        ),
                      ),
                      child: const Text(
                        'DFS',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          List<Pair<int, int>> res = GraphAlgorithms()
                              .findPathUsing2dBfs(selectedCells);

                          await changeColorWithDelay(res);
                        } catch (e) {
                          toastification.show(
                            context: context,
                            title: Text(e.toString()),
                            autoCloseDuration: const Duration(seconds: 3),
                            icon: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            return Colors.black26;
                          },
                        ),
                      ),
                      child: const Text(
                        'BFS',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: cellWidth / cellHeight,
                ),
                itemCount: width * height,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // 0 gray
                      // 1 green
                      // 2 red
                      setState(() {
                        selectedCells[index] = getValueCell(index);
                      });
                    },
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      color: getColorCell(index),
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void removeYellowColor() {
    for (int i = 0; i < 100; i++) {
      if (selectedCells[i] == 4) {
        selectedCells[i] = 0;
      }
    }
    setState(() {});
  }
}
