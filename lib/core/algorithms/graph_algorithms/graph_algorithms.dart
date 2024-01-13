
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
  List<String> findPathUsingBFS(String source, Map<String, List<Pair<String, String>>> graph) {

    return BFS().bfs(source, generateUndirectedGraph(graph));

  }
  @override
  List<String> findPathUsingDijkstra(String source, Map<String, List<Pair<String, String>>> graph) {
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



 
}




