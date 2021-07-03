import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/map/dungeon_map.dart';

class Spikes extends GameDecoration with Sensor {
  Timer timer;

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
    if (timer == null &&
        this.animation.currentIndex > 6 &&
        component is Attackable) {
      (component as Attackable)
          .receiveDamage((Random().nextInt(100) * 0.1 + 10).roundToDouble(), 1);
      timer = Timer(0.5, callback: () {
        timer = null;
      }, repeat: true);
    }
  }
}
