import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flutter/material.dart';

class Torch extends GameDecoration with Lighting {
  Torch(Vector2 position)
      : super.withAnimation(
          SpriteAnimation.load(
            "items/torch_spritesheet.png",
            SpriteAnimationData.sequenced(
              amount: 6,
              stepTime: 0.15,
              textureSize: Vector2(16, 16),
            ),
          ),
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
          position: position,
        ) {
    setupLighting(LightingConfig(
      radius: width * 1.5,
      blurBorder: width * 1.5,
      color: Colors.deepOrangeAccent.withOpacity(0.2),
    ));
  }
}
