import 'package:flame_audio/flame_audio.dart';

class Sounds {
  static bool isLoadAudio = false;

  static void initialize() {
    if (!isLoadAudio) {
      isLoadAudio = true;
      FlameAudio.bgm.loadAll([
        'sound_bg.mp3',
        'menu_bg.mp3',
        'battle_boss.mp3',
      ]);
      FlameAudio.bgm.initialize();
      FlameAudio.audioCache.loadAll([
        'attack_player.mp3',
        'attack_fire_ball.wav',
        'attack_enemy.mp3',
        'explosion.wav',
        'sound_interaction.wav',
      ]);
    }
  }

  static void attackRange() {
    FlameAudio.audioCache.play('attack_fire_ball.wav', volume: 0.3);
  }

  static void attackMelee() {
    FlameAudio.audioCache.play('attack_enemy.mp3', volume: 0.4);
  }

  static void attackRangeExplosion() {
    FlameAudio.audioCache.play('explosion.wav');
  }

  static void interaction() {
    FlameAudio.audioCache.play('sound_interaction.wav', volume: 0.4);
  }

  static void stopBackgroundSound() {
    FlameAudio.bgm.dispose();
  }

  static void playGameBackgroundSound() {
    FlameAudio.bgm.play('sound_bg.mp3', volume: 0.3);
  }

  static void playMenuBackgroundSound() {
    FlameAudio.bgm.play('menu_bg.mp3', volume: 0.5);
  }

  static void playBackgroundBoosSound() {
    FlameAudio.bgm.play('battle_boss.mp3');
  }

  static void pauseBackgroundSound() {
    FlameAudio.bgm.pause();
  }

  static void resumeBackgroundSound() {
    FlameAudio.bgm.resume();
  }
}
