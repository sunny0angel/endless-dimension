import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/decoration/potion_life.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flutter/material.dart';

class Chest extends GameDecoration with TapGesture {
  bool _observedPlayer = false;

  TextPaintConfig _TextPaintConfig;

  Chest(Vector2 position)
      : super.withAnimation(
          SpriteAnimation.load(
            "items/chest_spritesheet.png",
            SpriteAnimationData.sequenced(
              amount: 8,
              stepTime: 30,
              textureSize: Vector2(16, 16),
            ),
          ),
          width: DungeonMap.tileSize * 0.6,
          height: DungeonMap.tileSize * 0.6,
          position: position,
        ) {
    _TextPaintConfig = TextPaintConfig(
      color: Colors.white,
      fontSize: width / 2,
    );
  }

  @override
  void update(double dt) {
    this.seePlayer(
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
      TextPaint(config: _TextPaintConfig).render(
        canvas,
        'Touch me !!',
        Vector2(this.position.left - width / 1.5, this.position.top - (height + 5)),
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
        animation: FlameAnimation.Animation.sequenced(
          "smoke_explosin.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        position: Vector2.translate(width * 2, 0),
      ),
    );

    gameRef.add(
      AnimatedObjectOnce(
        animation: FlameAnimation.Animation.sequenced(
          "smoke_explosin.png",
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        position: position.translate(width * 2, height * 2),
      ),
    );
  }

  void _showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: FlameAnimation.Animation.sequenced(
          'player/emote_exclamacao.png',
          8,
          textureWidth: 32,
          textureHeight: 32,
        ),
        target: this,
        positionFromTarget: Vector2Rect(Vector2(18, -6), Vector2(16, 16)),
      ),
    );
  }
}
