import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/collision/object_collision.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:endless_dimension/util/animations/common_sprite_sheet.dart';
import 'package:endless_dimension/util/dialogs.dart';
import 'package:endless_dimension/util/animations/player_sprite_sheet.dart';
import 'package:endless_dimension/util/sounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:endless_dimension/menu.dart';

class Knight extends SimplePlayer with Lighting, ObjectCollision {
  final Position initPosition;
  double attack = 20;
  double magic = 100;
  double initSpeed = DungeonMap.tileSize * 3;
  IntervalTick _timerMagic = IntervalTick(100);
  IntervalTick _timerAttackRange = IntervalTick(100);
  IntervalTick _timerSeeEnemy = IntervalTick(500);
  bool showObserveEnemy = false;
  bool showTalk = false;
  double angleRadAttack = 0.0;
  Rect rectDirectionAttack;
  Sprite spriteDirectionAttack;
  bool execAttackRange = false;

  Knight(this.initPosition)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
          initPosition: initPosition,
          life: 200,
          speed: DungeonMap.tileSize * 3,
        ) {
    spriteDirectionAttack = Sprite('direction_attack.png');
    lightingConfig = LightingConfig(
      radius: width * 1.5,
      blurBorder: width * 1.5,
    );
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea(
            height: DungeonMap.tileSize / 2,
            width: DungeonMap.tileSize / 1.8,
            align: Offset(DungeonMap.tileSize / 3.5, DungeonMap.tileSize / 2),
          ),
        ],
      ),
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;

    if (gameRef.joystickController.keyboardEnable) {
      if (event.id == LogicalKeyboardKey.space.keyId) {
        actionAttack();
      }
    }

    if (event.id == 0 && event.event == ActionEvent.DOWN) {
      actionAttack();
    }

    if (event.id == 1) {
      if (event.event == ActionEvent.MOVE) {
        execAttackRange = true;
        angleRadAttack = event.radAngle;
        // actionAttackRange();
      }
      if (event.event == ActionEvent.UP) {
        execAttackRange = false;
      }
    }

    super.joystickAction(event);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      GameDecoration(
        position: Position(
          position.left,
          position.top,
        ),
        height: DungeonMap.tileSize,
        width: DungeonMap.tileSize,
        sprite: Sprite('player/crypt.png'),
      ),
    );
    super.die();
  }

  void actionAttack() {
    if (magic < 15) return;
    Sounds.attackMelee();
    decrementMagic(15);
    this.simpleAttackMelee(
      damage: attack,
      animationBottom: CommonSpriteSheet.whiteAttackEffectBottom,
      animationLeft: CommonSpriteSheet.whiteAttackEffectLeft,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      animationTop: CommonSpriteSheet.whiteAttackEffectTop,
      heightArea: DungeonMap.tileSize,
      widthArea: DungeonMap.tileSize,
    );
  }

  void actionAttackRange() {
    if (magic < 5) return;
    Sounds.attackRange();
    decrementMagic(5);
    this.simpleAttackRangeByAngle(
      id: {'ddd': 'kkkkk'},
      animationTop: CommonSpriteSheet.fireBallTop,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      radAngleDirection: angleRadAttack,
      width: width * 1,
      height: width * 1,
      damage: 5,
      range: 500,
      speed: initSpeed * 2,
      collision: CollisionConfig(
        collisions: [
          CollisionArea(
            width: width / 2,
            height: width / 2,
            align: Offset(width * 0.1, 0),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: width * 0.5,
        blurBorder: width,
      ),
      destroy: () {
        Sounds.attackRangeExplosion();
      },
    );
  }

  @override
  void update(double dt) {
    if (this.isDead || gameRef?.size == null) return;
    _verifyMagic(dt);

    if (_timerSeeEnemy.update(dt) && !showObserveEnemy) {
      this.seeEnemy(
        radiusVision: width * 5,
        notObserved: () {
          showObserveEnemy = false;
        },
        observed: (enemies) {
          showObserveEnemy = true;
          showEmote();
          if (!showTalk) {
            showTalk = true;
            _showTalk(enemies.first);
          }
        },
      );
    }

    if (execAttackRange && _timerAttackRange.update(dt)) actionAttackRange();
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    _drawDirectionAttack(c);
    super.render(c);
  }

  void _verifyMagic(double dt) {
    if (_timerMagic.update(dt) && magic < 100) {
      magic += 2;
      if (magic > 100) {
        magic = 100;
      }
    }
  }

  void decrementMagic(int i) {
    magic -= i;
    if (magic < 0) {
      magic = 0;
    }
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(damage,
        config: TextConfig(
          fontSize: width / 3,
          color: Colors.red,
        ));
    super.receiveDamage(damage, from);
  }

  bool _showPauseMenu = false;
  bool get showPauseMenu => _showPauseMenu;
  void setShowPauseMenu(bool value) {
    _showPauseMenu = value;
  }

  bool _showPlayerState = false;
  bool get showPlayerState => _showPlayerState;
  void setShowPlayerState(bool value) {
    _showPlayerState = value;
  }

  bool _showItem = false;
  bool get showItem => _showItem;
  void setShowItem(bool value) {
    _showItem = value;
  }

  void showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emote,
        target: this,
        positionFromTarget: Rect.fromLTWH(18, -6, width / 2, height / 2),
      ),
    );
  }

  void _showTalk(Enemy first) {
    gameRef.gameCamera.moveToTargetAnimated(first, zoom: 2, finish: () {
      gameRef.pause();
      TalkDialog.show(gameRef.context, [
        Say(
          "Look at this! It seems that I'm not alone here ...",
          Container(
            width: 50,
            height: 50,
            child: AnimationWidget(
              animation: animation.current,
              playing: true,
            ),
          ),
        ),
      ], finish: () {
        gameRef.resume();
        gameRef.gameCamera.moveToPlayerAnimated();
      });
    });
  }

  void _drawDirectionAttack(Canvas c) {
    if (execAttackRange) {
      double radius = position.height;
      rectDirectionAttack = Rect.fromLTWH(position.center.dx - radius,
          position.center.dy - radius, radius * 2, radius * 2);
      renderSpriteByRadAngle(
        c,
        angleRadAttack,
        rectDirectionAttack,
        spriteDirectionAttack,
      );
    }
  }
}
