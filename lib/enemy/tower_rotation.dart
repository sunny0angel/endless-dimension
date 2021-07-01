import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/collision/object_collision.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class TowerRotation extends RotationEnemy with ObjectCollision {
  TowerRotation(Position initPosition)
      : super(
          animIdle: FlameAnimation.Animation.sequenced(
            "enemy/ballista.png",
            1,
            textureWidth: 64,
            textureHeight: 64,
          ),
          animRun: FlameAnimation.Animation.sequenced(
            "enemy/ballista.png",
            6,
            textureWidth: 64,
            textureHeight: 64,
          ),
          initPosition: initPosition,
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea(
            height: DungeonMap.tileSize * 0.4,
            width: DungeonMap.tileSize * 0.4,
            align: Offset(
              DungeonMap.tileSize * 0.2,
              DungeonMap.tileSize * 0.4,
            ),
          ),
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
              animationTop: FlameAnimation.Animation.sequenced(
                'enemy/ballista_bolts.png',
                2,
                textureWidth: 64,
                textureHeight: 64,
              ),
              animationDestroy: FlameAnimation.Animation.sequenced(
                'player/explosion_fire.png',
                6,
                textureWidth: 32,
                textureHeight: 32,
              ),
              width: 25,
              height: 25,
              damage: 10,
              speed: speed * 1.5,
              range: 500,
              collision: CollisionConfig(
                  collisions: [CollisionArea(height: 15, width: 15)]));
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
          animation: FlameAnimation.Animation.sequenced(
            "smoke_explosin.png",
            6,
            textureWidth: 16,
            textureHeight: 16,
          ),
          position: position),
    );
    remove();
    super.die();
  }
}
