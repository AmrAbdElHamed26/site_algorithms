import 'package:algorithms_site/app/graph_module/data_layer/data_source/graph_data_source.dart';
import 'package:algorithms_site/app/graph_module/domain_layer/repository/base_graph_repository.dart';

import '../../../../core/services/pair.dart';

class GraphRepository extends BaseGraphRepository{
  final BaseGraphDataSource baseGraphDataSource ;

  GraphRepository(this.baseGraphDataSource);

  @override
  Map<String, List<Pair<String, String>>> addNewNodeToTheGraph(String nodes) {
    final result = baseGraphDataSource.getAllNodes(nodes);

    return result;
  }



}