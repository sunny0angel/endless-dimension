import 'package:endless_dimension/util/widget/bgm_mute_button.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';

enum BgmType { menu, game, boss }

class Sounds {
  static bool _isLoadAudio = false;

  static late BgmType bgmType;

  static late AudioPool _audioPoolRangeAttack;
  static late AudioPool _audioPoolMeleeAttack;
  static late AudioPool _audioPoolExplosion;
  static late AudioPool _audioPoolInteraction;

  static void initialize() async {
    if (!_isLoadAudio && (!kIsWeb || !mute)) {
      _isLoadAudio = true;
      FlameAudio.bgm.loadAll([
        'sound_bg.mp3',
        'menu_bg.mp3',
        'battle_boss.mp3',
      ]);
      FlameAudio.bgm.initialize();
      _audioPoolRangeAttack = await AudioPool.create('attack_fire_ball.wav',
          repeating: false, maxPlayers: 20, prefix: 'assets/audio/');
      _audioPoolMeleeAttack = await AudioPool.create('attack_enemy.mp3',
          repeating: false, maxPlayers: 20, prefix: 'assets/audio/');
      _audioPoolExplosion = await AudioPool.create('explosion.wav',
          repeating: false, maxPlayers: 1, prefix: 'assets/audio/');
      _audioPoolInteraction = await AudioPool.create('sound_interaction.wav',
          repeating: false, maxPlayers: 20, prefix: 'assets/audio/');
    }
  }

  static void dispose() {
    if (_isLoadAudio) {
      _isLoadAudio = false;
      disposeBackgroundSound();
    }
  }

  static void attackRange() {
    // FlameAudio.audioCache.play('attack_fire_ball.wav', volume: 0.3);
    if (!kIsWeb || !mute) _audioPoolRangeAttack.start(volume: 0.3);
  }

  static void attackMelee() {
    // FlameAudio.audioCache.play('attack_enemy.mp3', volume: 0.4);
    if (!kIsWeb || !mute) _audioPoolMeleeAttack.start(volume: 0.4);
  }

  static void attackRangeExplosion() {
    //   FlameAudio.audioCache.play('explosion.wav');
    if (!kIsWeb || !mute) _audioPoolExplosion.start();
  }

  static void interaction() {
    // FlameAudio.audioCache.play('sound_interaction.wav', volume: 0.4);
    if (!kIsWeb || !mute) _audioPoolInteraction.start(volume: 0.4);
  }

  // TODO in case of web, because it is a async stop function, it will be effectively stopped when the bgm is already changed
  static void stopBackgroundSound() {
    FlameAudio.bgm.stop();
  }

  static void playBackgroundSound() {
    if (!kIsWeb || !mute) {
      switch (bgmType) {
        case BgmType.menu:
          FlameAudio.bgm.play('menu_bg.mp3', volume: 0.5);
          break;
        case BgmType.game:
          FlameAudio.bgm.play('sound_bg.mp3', volume: 0.3);
          break;
        case BgmType.boss:
          FlameAudio.bgm.play('battle_boss.mp3');
          break;
        default:
          break;
      }
    }
  }

  static void disposeBackgroundSound() {
    FlameAudio.bgm.dispose();
  }

  static void pauseBackgroundSound() {
    FlameAudio.bgm.pause();
  }

  static void resumeBackgroundSound() {
    FlameAudio.bgm.resume();
  }
}
