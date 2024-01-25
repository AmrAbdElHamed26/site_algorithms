import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/pair.dart';
import 'bfs_algo.dart';
import 'dfs_algo.dart';
import 'dijkstra_algo.dart';

abstract class BaseGraphAlgorithms {
  List<String> findPathUsingDFS(
    String source,
    Map<String, List<Pair<String, String>>> graph,
  );

  List<String> findPathUsingBFS(
    String source,
    Map<String, List<Pair<String, String>>> graph,
  );

  List<String> findPathUsingDijkstra(
    String source,
    Map<String, List<Pair<String, String>>> graph,
  );

  List<Pair<int, int>> findPathUsing2dDfs(List<int> graph);
  List<Pair<int, int>> findPathUsing2dBfs(List<int> graph);

}

class GraphAlgorithms extends BaseGraphAlgorithms {
  @override
  List<String> findPathUsingDFS(
    String source,
    Map<String, List<Pair<String, String>>> graph,
  ) {
    return DFS().dfs(source, generateUndirectedGraph(graph));
  }

  @override
  List<String> findPathUsingBFS(
      String source, Map<String, List<Pair<String, String>>> graph) {
    return BFS().bfs(source, generateUndirectedGraph(graph));
  }

  @override
  List<String> findPathUsingDijkstra(
      String source, Map<String, List<Pair<String, String>>> graph) {
    return Dijkstra().dijkstra(source, generateUndirectedGraph(graph));
  }

  Map<String, List<Pair<String, String>>> generateUndirectedGraph(
      Map<String, List<Pair<String, String>>> data) {
    Map<String, List<Pair<String, String>>> undirectedGraph = {};
    data.forEach((key, value) {
      undirectedGraph[key] ??= [];
      for (var child in value) {
        undirectedGraph[key]!.add(Pair(child.first, child.second));

        undirectedGraph[child.first] ??= [];
        undirectedGraph[child.first]!.add(Pair(key, child.second));
      }
    });
    return undirectedGraph;
  }

  List<List<int>> to2D(List<int> flatList, int numRows, int numCols) {
    List<List<int>> result = [];
    for (int i = 0; i < numRows; i++) {
      result.add(flatList.sublist(i * numCols, (i + 1) * numCols));
    }
    return result;
  }

  @override
  List<Pair<int, int>> findPathUsing2dDfs(List<int> graph) {
    try {
      return DFS().dfs2d(to2D(graph, 10, 10));
    } catch (e) {
      throw(e.toString());

    }
  }

  @override
  List<Pair<int, int>> findPathUsing2dBfs(List<int> graph) {
    try {
      return BFS().bfs2d(to2D(graph, 10, 10));
    } catch (e) {
      throw(e.toString());

    }
  }
}
