import 'dart:math';
import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/map/dungeon_map.dart';

class Spikes extends GameDecoration with Sensor {
  async.Timer? timer;

  Spikes(Vector2 position)
      : super.withAnimation(
            SpriteAnimation.load(
              "items/spikes.png",
              SpriteAnimationData.variable(
                amount: 10,
                stepTimes: [
                  Random().nextInt(50) * 0.1 + 1,
                  Random().nextInt(50) * 0.1 + 1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1,
                  0.1
                ],
                textureSize: Vector2(16, 16),
              ),
            ),
            width: DungeonMap.tileSize,
            height: DungeonMap.tileSize,
            position: position);

  @override
  void onContact(GameComponent component) {
    if (timer == null) {
      if (component is Attackable && this.animation!.currentIndex > 6) {
        component.receiveDamage(
            (Random().nextInt(100) * 0.1 + 10).roundToDouble(), 1);
        timer = async.Timer(Duration(milliseconds: 500), () {
          timer = null;
        });
      }
    }
  }

  @override
  int get priority => LayerPriority.MAP + 1;
}
