import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/map/dungeon_map.dart';

class TowerRotation extends RotationEnemy with ObjectCollision {
  TowerRotation(Vector2 position)
      : super(
          animIdle: SpriteAnimation.load(
            "enemy/ballista.png",
            SpriteAnimationData.sequenced(
              amount: 1,
              stepTime: 30,
              textureSize: Vector2(64, 64),
            ),
          ),
          animRun: SpriteAnimation.load(
            "enemy/ballista.png",
            SpriteAnimationData.sequenced(
              amount: 6,
              stepTime: 30,
              textureSize: Vector2(64, 64),
            ),
          ),
          position: position,
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
              size: Size(DungeonMap.tileSize * 0.4, DungeonMap.tileSize * 0.4))
        ],
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    this.drawDefaultLifeBar(canvas);
  }

  @override
  void update(double dt) {
    this.seeAndMoveToAttackRange(
        positioned: (player) {
          this.simpleAttackRange(
              animationTop: SpriteAnimation.load(
                'enemy/ballista_bolts.png',
                SpriteAnimationData.sequenced(
                  amount: 2,
                  stepTime: 30,
                  textureSize: Vector2(64, 64),
                ),
              ),
              animationDestroy: SpriteAnimation.load(
                'player/explosion_fire.png',
                SpriteAnimationData.sequenced(
                  amount: 6,
                  stepTime: 30,
                  textureSize: Vector2(32, 32),
                ),
              ),
              width: 45,
              height: 45,
              damage: 10,
              speed: speed * 1.5,
              collision: CollisionConfig(
                  collisions: [CollisionArea.rectangle(size: Size(15, 15))]));
        },
        radiusVision: DungeonMap.tileSize * 4,
        minDistanceCellsFromPlayer: 3);
    super.update(dt);
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(damage);
    super.receiveDamage(damage, from);
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
          animation: SpriteAnimation.load(
            "smoke_explosin.png",
            SpriteAnimationData.sequenced(
              amount: 6,
              stepTime: 30,
              textureSize: Vector2(16, 16),
            ),
          ),
          position: position),
    );
    remove();
    super.die();
  }
}
