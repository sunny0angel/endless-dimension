import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
      "enemy/goblin_idle_left.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      "enemy/goblin_idle.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
      "enemy/goblin_run_right.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
      ));

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
      "enemy/goblin_run_left.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
      ));

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleLeft: idleLeft,
        idleRight: idleRight,
        runLeft: runLeft,
        runRight: runRight,
      );
}
