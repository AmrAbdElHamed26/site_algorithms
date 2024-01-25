import 'dart:collection';

import '../../services/pair.dart';

class BFS {
  List<String> bfs(
      String source, Map<String, List<Pair<String, String>>> graph) {
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

  List<String> constructPath(
      int numberOfNodes, String sourceNode, Map<String, String> parent) {
    String node = numberOfNodes.toString();
    List<String> path = [node];

    while (parent[node] != sourceNode) {
      path.add(parent[node]!);
      node = parent[node]!;
    }
    path.add(sourceNode);
    return path.reversed.toList();
  }

  List<Pair<int, int>> bfs2d(List<List<int>> grid) {
    int numRows = grid.length;
    int numCols = grid[0].length;

    Map<Pair<int, int>, Pair<int, int>> parent2d = {};

    List<int> dx = [1, -1, 0, 0];
    List<int> dy = [0, 0, 1, -1];

    Pair<int, int> source = getStartPoint(grid);
    Pair<int, int> destination = getEndPoint(grid);

    Queue<Pair<int, int>> queue = Queue<Pair<int, int>>();
    queue.add(source);

    while (queue.isNotEmpty) {
      Pair<int, int> currentNode = queue.removeFirst();

      for (int i = 0; i < 4; i++) {
        int newX = currentNode.first + dx[i];
        int newY = currentNode.second + dy[i];

        Pair<int, int> neighbor = Pair(newX, newY);

        if (newX >= 0 &&
            newX < numRows &&
            newY >= 0 &&
            newY < numCols &&
            grid[newX][newY] != 3 &&
            grid[newX][newY] != 6) {
          queue.add(neighbor);
          grid[newX][newY] = 6;
          parent2d[neighbor] = currentNode;
        }
      }
    }

    // Reconstruct the path
    List<Pair<int, int>> path = [];
    Pair<int, int>? current = parent2d[destination];
    while (current != null && current != source) {
      path.add(current);
      current = parent2d[current];
    }
    if (current == null) {
      throw ("No path found");
    }

    return path.reversed.toList();
  }

  Pair<int, int> getStartPoint(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] == 1) return Pair(i, j);
      }
    }
    throw ("Start point not selected");
  }

  Pair<int, int> getEndPoint(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] == 2) return Pair(i, j);
      }
    }
    throw ("End point not selected");
  }
}
