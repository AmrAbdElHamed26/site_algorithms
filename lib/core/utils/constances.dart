import '../../app/graph_module/presentation_layer/screens/graph_grid_screen.dart';
import '../../app/graph_module/presentation_layer/screens/graph_nodes_screen.dart';

class Constances {
  static const defaultGraph="1 2 100\n1 3 100\n1 4 10\n2 5 100\n2 6 100\n3 6 100\n5 6 1\n3 4 10\n1 6 200";
  static const screens =[NodesGraphScreen() , GraphGridScreen()];

}