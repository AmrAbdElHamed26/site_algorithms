part of 'graph_board_bloc.dart';

abstract class GraphBoardEvent extends Equatable {
  const GraphBoardEvent();
}

class AddNewNodeToGraphEvent extends GraphBoardEvent{
  final String nodes ;
  const AddNewNodeToGraphEvent({required this.nodes});

  @override
  List<Object?> get props => [nodes];

}