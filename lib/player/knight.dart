import 'dart:io';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:endless_dimension/util/animations/common_sprite_sheet.dart';
import 'package:endless_dimension/util/animations/player_sprite_sheet.dart';
import 'package:endless_dimension/util/sounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Knight extends SimplePlayer with Lighting, ObjectCollision, MouseGesture {
  final Vector2 positionVector;
  double attack = 20;
  double magic = 100;
  double initSpeed = DungeonMap.tileSize * 3;
  IntervalTick _timerMagic = IntervalTick(100);
  IntervalTick _timerAttackRange = IntervalTick(100);
  IntervalTick _timerSeeEnemy = IntervalTick(500);
  bool showObserveEnemy = false;
  bool showTalk = false;
  double angleRadAttack = 0.0;
  Rect? rectDirectionAttack;
  Sprite? spriteDirectionAttack;
  bool execAttackRange = false;
  bool execAttackRangeBigFire = false;
  bool canShowEmoteFromHover = true;

  Rect _rectHover =
      Rect.fromLTWH(0, 0, DungeonMap.tileSize, DungeonMap.tileSize);
  Paint paintHover = new Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  Knight(this.positionVector)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          width: DungeonMap.tileSize,
          height: DungeonMap.tileSize,
          position: positionVector,
          life: 200,
          speed: DungeonMap.tileSize * 3,
        ) {
    this.aboveComponents = true;
    setupLighting(LightingConfig(
      radius: width * 1.5,
      blurBorder: width * 1.5,
      color: Colors.transparent,
    ));
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(DungeonMap.tileSize / 2, DungeonMap.tileSize / 2),
            align: Vector2(DungeonMap.tileSize / 3.5, DungeonMap.tileSize / 2),
          ),
        ],
      ),
    );
    setupMoveToPositionAlongThePath(
      showBarriersCalculated: true,
    );

    _enableMouseGesture();
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;

    if (event.id == LogicalKeyboardKey.keyZ.keyId ||
        (event.id == 0 && event.event == ActionEvent.DOWN)) {
      actionAttack();
    }
    if (event.id == LogicalKeyboardKey.keyX.keyId ||
        (event.id == 10 && event.event == ActionEvent.DOWN)) {
      actionAttackRepel();
    }
    if (event.id == LogicalKeyboardKey.keyC.keyId) {
      // TODO actionAttackRange
    }
    if (event.id == LogicalKeyboardKey.keyV.keyId) {
      // TODO actionAttackRange
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

    if (event.id == 11) {
      if (event.event == ActionEvent.MOVE) {
        execAttackRangeBigFire = true;
        angleRadAttack = event.radAngle;
        // actionAttackRange();
      }
      if (event.event == ActionEvent.UP) {
        execAttackRangeBigFire = false;
      }
    }

    super.joystickAction(event);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      GameDecoration.withSprite(
        Sprite.load('player/crypt.png'),
        position: positionVector,
        height: DungeonMap.tileSize,
        width: DungeonMap.tileSize,
      ),
    );
    super.die();
  }

  void actionAttack() {
    Sounds.attackMelee();
    this.simpleAttackMelee(
      damage: attack * 0.1,
      animationBottom: CommonSpriteSheet.whiteAttackEffectBottom,
      animationLeft: CommonSpriteSheet.whiteAttackEffectLeft,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      animationTop: CommonSpriteSheet.whiteAttackEffectTop,
      height: DungeonMap.tileSize,
      width: DungeonMap.tileSize,
      withPush: false,
    );
  }

  void actionAttackRepel() {
    if (magic < 20) return;
    Sounds.attackMelee();
    decrementMagic(20);
    this.simpleAttackMelee(
      damage: attack,
      animationBottom: CommonSpriteSheet.whiteAttackEffectBottom,
      animationLeft: CommonSpriteSheet.whiteAttackEffectLeft,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      animationTop: CommonSpriteSheet.whiteAttackEffectTop,
      height: DungeonMap.tileSize * 2,
      width: DungeonMap.tileSize * 2,
      withPush: true,
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
      width: width,
      height: width,
      damage: 5,
      speed: initSpeed * 2,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: width / 2,
            align: Vector2(width * 0.1, 0),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: width * 0.5,
        blurBorder: width,
        color: Colors.transparent
      ),
      destroy: () {
        Sounds.attackRangeExplosion();
      },
    );
  }

  void actionAttackRangeBigFire() {
    if (magic < 30) return;
    Sounds.attackRange();
    decrementMagic(30);
    this.simpleAttackRangeByAngle(
      id: {'ddd': 'kkkkk'},
      animationTop: CommonSpriteSheet.fireBallTop,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      radAngleDirection: angleRadAttack,
      width: width * 3,
      height: width * 3,
      damage: 40,
      speed: initSpeed * 3,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: width / 2 * 3,
            align: Vector2(width * 0.1, 0),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: width / 2 * 3,
        blurBorder: width,
          color: Colors.transparent
      ),
      destroy: () {
        Sounds.attackRangeExplosion();
      },
    );
  }

  @override
  void update(double dt) {
    if (this.isDead || gameRef.size == null) return;
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
    if (execAttackRangeBigFire && _timerAttackRange.update(dt))
      actionAttackRangeBigFire();
    super.update(dt);
  }

  void _verifyMagic(double dt) {
    if (_timerMagic.update(dt) && magic < 100) {
      magic += 0.1;
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
        config: TextPaintConfig(
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
        positionFromTarget:
            Vector2Rect(Vector2(18, -6), Vector2(width / 2, height / 2)),
      ),
    );
  }

  void _showTalk(Enemy first) {
    gameRef.camera.moveToTargetAnimated(first, zoom: 2, finish: () {
      gameRef.pauseEngine();
      TalkDialog.show(gameRef.context, [
        Say(
          "Look at this! It seems that I'm not alone here ...",
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: AnimationWidget(
          //     animation: animation.current,
          //     playing: true,
          //   ),
          // ),
        ),
      ], finish: () {
        gameRef.resumeEngine();
        gameRef.camera.moveToPlayerAnimated();
      });
    });
  }

  @override
  Future<void> onLoad() async {
    spriteDirectionAttack = await Sprite.load('direction_attack.png');
    return super.onLoad();
  }

  void _drawDirectionAttack(Canvas c) {
    if (execAttackRange) {
      double radius = position.height;
      rectDirectionAttack = Rect.fromLTWH(
        position.center.dx - radius,
        position.center.dy - radius,
        radius * 2,
        radius * 2,
      );

      if (rectDirectionAttack != null && spriteDirectionAttack != null) {
        renderSpriteByRadAngle(
          c,
          angleRadAttack,
          rectDirectionAttack!.toVector2Rect(),
          spriteDirectionAttack!,
        );
      }
    }
  }

  @override
  void render(Canvas c) {
    _drawDirectionAttack(c);
    if (_rectHover.left != 0 || _rectHover.top != 0) {
      c.drawRect(_rectHover, paintHover);
    }
    super.render(c);
  }

  @override
  void onHoverEnter(int pointer, Offset position) {
    if (canShowEmoteFromHover) {
      canShowEmoteFromHover = false;
      showEmote();
    }
  }

  @override
  void onHoverExit(int pointer, Offset position) {
    canShowEmoteFromHover = true;
  }

  @override
  void onHoverScreen(int pointer, Offset position) {
    Offset p = gameRef.screenPositionToWorld(position);
    double left = p.dx - (p.dx % DungeonMap.tileSize);
    double top = p.dy - (p.dy % DungeonMap.tileSize);
    _rectHover = Rect.fromLTWH(left, top, _rectHover.width, _rectHover.height);
  }

  @override
  void onScroll(int pointer, Offset position, Offset scrollDelta) {
    print(scrollDelta);
    // do anything when use scroll of the mouse in your component
  }

  @override
  void onMouseCancel() {
    print('onMouseCancel');
  }

  @override
  void onMouseTapLeft() {
    print('onMouseTapLeft');
  }

  @override
  void onMouseTapRight() {
    print('onMouseTapRight');
  }

  @override
  void onMouseTapMiddle() {
    print('onMouseTapMiddle');
  }

  void _enableMouseGesture() {
    if (!kIsWeb) {
      enableMouseGesture =
          (Platform.isAndroid || Platform.isIOS) ? false : true;
    }
  }
}
