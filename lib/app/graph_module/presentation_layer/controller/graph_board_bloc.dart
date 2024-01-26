
import 'package:algorithms_site/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/use_cases/add_new_node_use_case.dart';
import 'graph_board_state.dart';
part 'graph_board_event.dart';

class GraphBoardBloc extends Bloc<GraphBoardEvent, GraphBoardState> {
  final AddNewNodeUseCase addNewNodeUseCase ;
  GraphBoardBloc(this.addNewNodeUseCase) : super(const GraphBoardState()) {
    on<AddNewNodeToGraphEvent>((event, emit) {

      var result = addNewNodeUseCase.execute(event.nodes);

      // comment
      emit(state.copyWith(
        allNodes: result,
      ));
    });
  }
}
