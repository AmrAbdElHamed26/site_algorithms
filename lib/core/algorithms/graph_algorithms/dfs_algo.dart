import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/pair.dart';

class DFS {
  Map<String, String> parent = {};
  Map<String,int>visited ={} ;

  Map<Pair<int,int>,Pair<int,int>> parent2d = {} ;
  List<int> dx = [1, -1, 0, 0, 1, -1, 1, -1];
  List<int> dy = [0, 0, 1, -1, 1, -1, -1, 1];

  List<String> _constructPath(int numberOfNodes , String sourceNode , Map<String,String>parent) {
    String node = numberOfNodes.toString();
    List<String> path = [node];

    while (parent[node] != sourceNode) {
      path.add(parent[node]!);
      node = parent[node]!;
    }
    path.add(sourceNode);
    return path.reversed.toList();
  }

  void _dfs(String node, Map<String, List<Pair<String, String>>> graph,
      Map<String, int> visited) {
    visited[node] = 1;

    for (var child in graph[node]!) {
      if (visited[child.first] == 0) {
        parent[child.first] = node;
        _dfs(child.first, graph, visited);
      }
    }
  }

  List<String>dfs(String node, Map<String, List<Pair<String, String>>> graph,){

    int numberOfNodes = graph.length ;
    for(int i = 1 ; i <= numberOfNodes ; i ++){
      visited[i.toString()] = 0 ;
      parent[i.toString()] = i.toString();
    }

    for(int i = 1 ; i <= numberOfNodes ;i ++){
      if(visited[i.toString()] == 0 ){
        _dfs(node, graph, visited);
      }
    }

    var path = _constructPath(numberOfNodes, node, parent);

    return path;
  }



  void _dfs2d(int x  , int y , List<List<int>> graph){
      graph[x][y] = 6 ;
      Pair<int, int> node1 = Pair(x, y);

      for (int i  = 0 ; i < 4 ; i ++ ){
        int newX = x+dx[i] ;
        int newY = y + dy[i];

        if(newX >= 0 && newX < 10 && newY >= 0 && newY < 10 &&graph[newX][newY]!=3 &&graph[newX][newY] != 6){
          Pair<int, int> node2 = Pair(newX, newY);
          parent2d[node2] = node1;
          _dfs2d(newX, newY, graph);
        }
      }
  }
  List<Pair<int, int>> dfs2d(List<List<int>> graph) {
    // get start and end point
    Pair<int, int> source = getStartPoint(graph);
    Pair<int, int> des = getEndPoint(graph);


    // start DFS
    _dfs2d(source.first, source.second, graph);

    // get path
    List<Pair<int, int>> path = [];

    Pair<int, int>? current = parent2d[des];
    while (current != null && current != source) {
      path.add(current);
      current = parent2d[current];
    }
    if (current == null) {

      throw ("No path found");
    }

    return path.reversed.toList();
  }


  Pair<int,int> getStartPoint(List<List<int>> graph){
    for (int i = 0 ;i < 10 ; i ++ ){
      for (int j = 0 ; j < 10 ; j ++){
        if(graph[i][j] == 1 )return Pair(i, j);
      }
    }
    throw ("start point not selected");
  }
  Pair<int,int> getEndPoint(List<List<int>> graph){
    for (int i = 0 ;i < 10 ; i ++ ){
      for (int j = 0 ; j < 10 ; j ++){
        if(graph[i][j] == 2)return Pair(i, j);
      }
    }
    throw ("end point not selected");
  }
}
