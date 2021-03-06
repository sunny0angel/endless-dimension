import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/decoration/potion_life.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flutter/material.dart';

class Chest extends GameDecoration with TapGesture {
  bool _observedPlayer = false;

  late TextPaintConfig _textPaintConfig;

  Chest(Vector2 position)
      : super.withAnimation(
          SpriteAnimation.load(
            "items/chest_spritesheet.png",
            SpriteAnimationData.sequenced(
              amount: 8,
              stepTime: 0.15,
              textureSize: Vector2(16, 16),
            ),
          ),
          width: DungeonMap.tileSize * 0.6,
          height: DungeonMap.tileSize * 0.6,
          position: position,
        ) {
    _textPaintConfig = TextPaintConfig(
      color: Colors.white,
      fontSize: width / 2,
    );
  }

  @override
  void update(double dt) {
    Player? player = gameRef.player;
    if (player == null) return;

    if (player.isDead) {
      return;
    }
    this.seeComponent(
      player,
      observed: (player) {
        if (!_observedPlayer) {
          _observedPlayer = true;
          _showEmote();
        }
      },
      notObserved: () {
        _observedPlayer = false;
      },
    );
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observedPlayer) {
      TextPaint(config: _textPaintConfig).render(
        canvas,
        'Touch me !!',
        Vector2(
            this.position.left - width / 1.5, this.position.top - (height + 5)),
      );
    }
  }

  @override
  void onTap() {
    if (_observedPlayer) {
      _addPotions();
      remove();
    }
  }

  void _addPotions() {
    gameRef.addGameComponent(
      PotionLife(
        Vector2(
          position.translate(width * 0.4, 0).left,
          position.translate(0, height * 0.4).top,
        ),
        30,
      ),
    );

    gameRef.addGameComponent(
      PotionLife(
        Vector2(
          position.translate(width * 0.6, 0).left,
          position.translate(0, height * 0.6).top,
        ),
        30,
      ),
    );

    gameRef.add(
      AnimatedObjectOnce(
        animation: SpriteAnimation.load(
          "smoke_explosin.png",
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        position: position.translate(width * 2, 0),
      ),
    );

    gameRef.add(
      AnimatedObjectOnce(
        animation: SpriteAnimation.load(
          "smoke_explosin.png",
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        position: position.translate(width * 2, height * 2),
      ),
    );
  }

  void _showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: SpriteAnimation.load(
          'player/emote_exclamacao.png',
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.15,
            textureSize: Vector2(32, 32),
          ),
        ),
        target: this,
        positionFromTarget: Vector2Rect(Vector2(18, -6), Vector2(16, 16)),
      ),
    );
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Offset position) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Offset position) {
    // TODO: implement onTapUp
  }
}
