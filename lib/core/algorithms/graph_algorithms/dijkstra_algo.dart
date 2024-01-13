import '../../services/pair.dart';
import 'package:collection/collection.dart';


class Dijkstra {
  List<String> dijkstra(String source, Map<String, List<Pair<String, String>>> graph) {
    Map<String, int> distance = {};
    Map<String, String> parent = {};
    Set<String> visited = {};
    PriorityQueue<String> priorityQueue = PriorityQueue<String>(
          (a, b) {

        String aValue = graph[a]![0].second;
        String bValue = graph[b]![0].second;
        return aValue.compareTo(bValue);
      },
    );

    for (String node in graph.keys) {
      distance[node] = 1000000;
      parent[node] = '';
    }

    distance[source] = 0;
    priorityQueue.add(source);

    while (priorityQueue.isNotEmpty) {
      String currentNode = priorityQueue.removeFirst();

      if (visited.contains(currentNode)) {
        continue;
      }

      visited.add(currentNode);

      for (Pair<String, String> neighbor in graph[currentNode]!) {
        String neighborNode = neighbor.first;
        int edgeWeight = int.parse(neighbor.second);
        int newDistance = distance[currentNode]! + edgeWeight;

        if (newDistance < distance[neighborNode]!) {
          distance[neighborNode] = newDistance;
          parent[neighborNode] = currentNode;
          priorityQueue.add(neighborNode);
        }
      }
    }

    var path = constructPath(graph.length,source, parent);

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
