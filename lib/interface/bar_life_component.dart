import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/player/knight.dart';
import 'package:flutter/material.dart';

class BarLifeComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;
  double maxMagic = 100;
  double magic = 0;

  BarLifeComponent()
      : super(
          id: 1,
          position: Position(20, 20),
          sprite: Sprite('health_ui.png'),
          width: 120,
          height: 40,
        );

  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      life = this.gameRef.player.life;
      maxLife = this.gameRef.player.maxLife;
      if (this.gameRef.player is Knight) {
        magic = (this.gameRef.player as Knight).magic;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawLife(c);
      _drawMagic(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawLife(Canvas canvas) {
    double xBar = position.left + 26;
    double yBar = position.top + 10;
    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarLife, yBar),
        Paint()
          ..color = _getColorLife(currentBarLife)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  void _drawMagic(Canvas canvas) {
    double xBar = position.left + 26;
    double yBar = position.top + 28;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarMagic = (magic * widthBar) / maxMagic;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarMagic, yBar),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  Color _getColorLife(double currentBarLife) {
    if (currentBarLife > widthBar - (widthBar / 3)) {
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
