import 'package:equatable/equatable.dart';

import '../../../../core/services/pair.dart';
import '../../../../core/utils/enums.dart';

class GraphBoardState extends Equatable {
  const GraphBoardState({
    this.allNodes = const {},
    this.allNodesState = RequestState.loading,

  });

  final Map<String, List<Pair<String, String>>>? allNodes;
  final RequestState allNodesState ;
  GraphBoardState copyWith({
    Map<String, List<Pair<String, String>>>? allNodes,
    RequestState? allNodesState,
  }) {
    return GraphBoardState(
      allNodes: allNodes ?? this.allNodes,
        allNodesState:allNodesState??this.allNodesState,
    );
  }

  @override
  List<Object?> get props => [allNodes,allNodesState];
}
