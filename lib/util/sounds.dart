import 'package:bonfire/bonfire.dart';

class Sounds {
  static bool isLoadAudio = false;

  static void initialize() {
    if (!isLoadAudio) {
      isLoadAudio = true;
      Flame.bgm.loadAll([
        'sound_bg.mp3',
        'menu_bg.mp3',
        'battle_boss.mp3',
      ]);
      Flame.bgm.initialize();
      Flame.audio.loadAll([
        'attack_player.mp3',
        'attack_fire_ball.wav',
        'attack_enemy.mp3',
        'explosion.wav',
        'sound_interaction.wav',
      ]);
    }
  }

  static void attackRange() {
    Flame.audio.play('attack_fire_ball.wav', volume: 0.3);
  }

  static void attackMelee() {
    Flame.audio.play('attack_enemy.mp3', volume: 0.4);
  }

  static void attackRangeExplosion() {
    Flame.audio.play('explosion.wav');
  }

  static void interaction() {
    Flame.audio.play('sound_interaction.wav', volume: 0.4);
  }

  static void stopBackgroundSound() {
    Flame.bgm.dispose();
  }

  static void playGameBackgroundSound() {
    Flame.bgm.play('sound_bg.mp3', volume: 0.3);
  }

  static void playMenuBackgroundSound() {
    Flame.bgm.play('menu_bg.mp3', volume: 0.5);
  }

  static void playBackgroundBoosSound() {
    Flame.bgm.play('battle_boss.mp3');
  }

  static void pauseBackgroundSound() {
    Flame.bgm.pause();
  }

  static void resumeBackgroundSound() {
    Flame.bgm.resume();
  }

  static void dispose() {
    Flame.bgm.dispose();
  }
}
