import 'package:algorithms_site/core/algorithms/graph_algorithms/bfs_algo.dart';
import 'package:algorithms_site/core/services/pair.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('BFS tests', () {

    test('Graph BFS', () {
      BFS bfs = BFS();

      Map<String, List<Pair<String, String>>> graph = {
        '1': [Pair('2', '1'), Pair('3', '2')],
        '2': [Pair('1', '1'), Pair('4', '3')],
        '3': [Pair('1', '2'), Pair('5', '4')],
        '4': [Pair('2', '3')],
        '5': [Pair('3', '4')],
      };

      String sourceNode = '1';

      List<String> path = bfs.bfs(sourceNode, graph);
      expect(path, equals(['1', '3', '5']));
    });

    test('2D Grid BFS', () {
      BFS bfs = BFS();

      List<List<int>> grid = [
        [1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 2],
      ];

      List<Pair<int, int>> path = bfs.bfs2d(grid);


      expect(path, equals([Pair(1, 0), Pair(2, 0), Pair(3, 0), Pair(4 , 0), Pair(4 , 1), Pair(4 , 2), Pair(4 , 3)]));
    });

    test('2D Grid BFS With Blocks , Should Return No Path Found', () {
      BFS bfs = BFS();

      List<List<int>> grid = [
        [1, 3, 0, 0, 0],
        [3, 3, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 2],
      ];



      try {
        bfs.bfs2d(grid);
        fail('Expected No path found exception, but no exception was thrown');
      } catch (e) {
        expect(e.toString(), equals('No path found'));
      }
    });

  });
}
