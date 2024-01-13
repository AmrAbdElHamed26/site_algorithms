
import 'package:algorithms_site/app/graph_module/domain_layer/repository/base_graph_repository.dart';

import '../../../../core/services/pair.dart';

class AddNewNodeUseCase{
  BaseGraphRepository baseGraphRepository;
  AddNewNodeUseCase(this.baseGraphRepository);
  Map<String, List<Pair<String, String>>> execute (String nodes){
    return baseGraphRepository.addNewNodeToTheGraph(nodes);
  }
}