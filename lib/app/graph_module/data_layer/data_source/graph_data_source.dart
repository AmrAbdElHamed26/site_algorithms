
import '../../../../core/services/pair.dart';

abstract class BaseGraphDataSource {
  Map<String, List<Pair<String, String>>> getAllNodes(String nodes);
}

class GraphDataSource extends BaseGraphDataSource{

  @override
  Map<String, List<Pair<String, String>>> getAllNodes(String nodes) {
    Map<String, List<Pair<String, String>>> result = {};

    List<String> lines = nodes.split('\n');

    for (String line in lines) {
      List<String> parts = line.split(' ');
      if(parts.isNotEmpty){
        String node1 = parts[0];

        String node2 = parts.length > 1 ? parts[1] : 'none';
        String value = parts.length > 2 ? parts[2] : '0';

        Pair<String, String> pair = Pair(node2, value);

        result.putIfAbsent(node1, () => []).add(pair);
      }
    }

    return result;
  }
}