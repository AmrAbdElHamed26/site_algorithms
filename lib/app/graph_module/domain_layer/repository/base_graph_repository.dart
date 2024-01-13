
import '../../../../core/services/pair.dart';

abstract class BaseGraphRepository {
  Map<String, List<Pair<String, String>>> addNewNodeToTheGraph(String nodes);
}