import 'dart:collection';

import '../../services/pair.dart';

class BFS {
  List<String> bfs(String source, Map<String, List<Pair<String, String>>> graph) {
    Map<String, String> parent = {};
    Map<String, int> visited = {};
    int numberOfNodes = graph.length;

    for (int i = 1; i <= numberOfNodes; i++) {
      visited[i.toString()] = 0;
      parent[i.toString()] = i.toString();
    }

    Queue<String> queue = Queue<String>();
    queue.add(source);
    visited[source] = 1;

    while (queue.isNotEmpty) {
      String currentNode = queue.removeFirst();

      for (Pair<String, String> neighbor in graph[currentNode]!) {
        String neighborNode = neighbor.first;


        if (visited[neighborNode] == 0) {
          queue.add(neighborNode);
          visited[neighborNode] = 1;
          parent[neighborNode] = currentNode;
        }
      }
    }

    var path = constructPath(numberOfNodes, source, parent);

    return path;
  }
  List<String> constructPath(int numberOfNodes , String sourceNode , Map<String,String>parent) {
    String node = numberOfNodes.toString();
    List<String> path = [node];

    while (parent[node] != sourceNode) {
      path.add(parent[node]!);
      node = parent[node]!;
    }
    path.add(sourceNode);
    return path.reversed.toList();
  }


}
