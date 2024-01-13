import 'dart:math';
import '../../../../core/services/pair.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/graph_board.dart';

class GraphPainter extends CustomPainter {
  final Map<String, List<Pair<String, String>>>? allNodes;
  final double screenWidth, screenHeight;

  GraphPainter(this.allNodes, this.screenHeight, this.screenWidth) {
    calculateNodePositions();
  }

  void calculateNodePositions() {
    if (allNodes != null) {
      allNodes!.forEach((key, pairs) {
        if (!nodePositions.containsKey(key)) {
          Offset position = nodePositions[key] ?? generateRandomPosition();
          while (nodePositions.containsValue(position)) {
            position = generateRandomPosition();
          }
          nodePositions[key] = position;
        }

        for (var pair in pairs) {
          if (pair.first != 'none') {
            if (!nodePositions.containsKey(pair.first)) {
              Offset childPosition =
                  nodePositions[pair.first] ?? generateRandomPosition();
              while (nodePositions.containsValue(childPosition)) {
                childPosition = generateRandomPosition();
              }
              nodePositions[pair.first] = childPosition;
            }
          }
        }
      });
    }
  }

  Offset generateRandomPosition() {
    final Random random = Random();
    double x = max(min(random.nextDouble() * (screenWidth) , 1042),33);
    double y = max(min(random.nextDouble() * (screenHeight), 530),37);


    return Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (allNodes == null) return;

    allNodes!.forEach((key, pairs) {
      drawNode(canvas, key, size, nodePositions[key] ?? Offset.zero);

      for (var pair in pairs) {
        if (pair.first != 'none') {
          drawNode(canvas, pair.first, size,
              nodePositions[pair.first] ?? Offset.zero);

          drawEdge(
            canvas,
            key,
            pair.first,
            pair.second != '0' ? pair.second : '0',
            size,
          );
        }
      }
    });
  }

  void drawEdge(
      Canvas canvas, String start, String end, String value, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final startOffset = nodePositions[start] ?? Offset.zero;
    final endOffset = nodePositions[end] ?? Offset.zero;

    final double startAngle =
    atan2(endOffset.dy - startOffset.dy, endOffset.dx - startOffset.dx);
    final double endAngle =
    atan2(startOffset.dy - endOffset.dy, startOffset.dx - endOffset.dx);
    final double radius = 20.0;

    final double startX = startOffset.dx + radius * cos(startAngle);
    final double startY = startOffset.dy + radius * sin(startAngle);
    final Offset newStartOffset = Offset(startX, startY);

    final double endX = endOffset.dx + radius * cos(endAngle);
    final double endY = endOffset.dy + radius * sin(endAngle);
    final Offset newEndOffset = Offset(endX, endY);

    canvas.drawLine(newStartOffset, newEndOffset, paint);

    if (value != null && value != '0') {
      final middleOffset = Offset((newStartOffset.dx + newEndOffset.dx) / 2,
          (newStartOffset.dy + newEndOffset.dy) / 2);

      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: value,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
          canvas,
          middleOffset -
              Offset(textPainter.width / 2, textPainter.height / 2 + 10));
    }
  }

  void drawNode(Canvas canvas, String key, Size size, Offset position) async {
    if (key.isNotEmpty) {
      Paint paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
      ..strokeWidth=2;

      if (path.contains(key)) {

        paint = Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill;
        canvas.drawCircle(position, 20, paint);

      }
      else {
        canvas.drawCircle(position, 20, paint);

      }


      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: key,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(canvas,
          position - Offset(textPainter.width / 2, textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
