
import 'package:algorithms_site/app/graph_module/data_layer/data_source/graph_data_source.dart';
import 'package:algorithms_site/app/graph_module/data_layer/repository/graph_repository.dart';
import 'package:algorithms_site/app/graph_module/domain_layer/repository/base_graph_repository.dart';
import 'package:algorithms_site/app/graph_module/domain_layer/use_cases/add_new_node_use_case.dart';
import 'package:algorithms_site/app/graph_module/presentation_layer/controller/graph_board_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator{
  void init(){
    ///blocs
    getIt.registerFactory(() => GraphBoardBloc(getIt()));

    /// Data source
    getIt.registerLazySingleton<BaseGraphDataSource>(() => GraphDataSource());

    ///Repository
    getIt.registerLazySingleton<BaseGraphRepository>(() => GraphRepository(getIt()));

    ///useCases
    getIt.registerLazySingleton<AddNewNodeUseCase>(() =>AddNewNodeUseCase(getIt()) );
  }
}