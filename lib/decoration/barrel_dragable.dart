import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flutter/material.dart';

class BarrelDraggable extends GameDecoration with DragGesture, ObjectCollision {
  late TextPaintConfig _textPaintConfig;

  BarrelDraggable(Vector2 position)
      : super.withSprite(
          Sprite.load('items/barrel.png'),
          position: position,
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
              size: Size(DungeonMap.tileSize * 0.6, DungeonMap.tileSize * 0.8))
        ],
      ),
    );
    _textPaintConfig =
        TextPaintConfig(color: Colors.white, fontSize: width / 4);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    TextPaint(config: _textPaintConfig).render(
      canvas,
      'Drag',
      Vector2(this.position.left + width / 5, this.position.top - width / 3),
    );
  }
}
