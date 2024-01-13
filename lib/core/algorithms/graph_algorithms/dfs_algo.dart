import '../../services/pair.dart';

class DFS {
  Map<String, String> parent = {};
  Map<String,int>visited ={} ;

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
}
