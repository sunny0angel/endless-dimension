import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/collision/object_collision.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flame/Vector2.dart';

class Spikes extends GameDecoration with Sensor {
  final Vector2 Vector2;
  Timer timer;

  bool isTick = false;

  Spikes(this.Vector2)
      : super.sprite(
          Sprite('items/spikes.png'),
          position: Vector2,
          width: DungeonMap.tileSize / 1.5,
          height: DungeonMap.tileSize / 1.5,
        );

  @override
  void onContact(ObjectCollision collision) {
    if (timer == null) {
      if (collision is Attackable) {
        (collision as Attackable).receiveDamage(10, 1);
        timer = Timer(Duration(milliseconds: 500), () {
          timer = null;
        });
      }
    }
  }
}
