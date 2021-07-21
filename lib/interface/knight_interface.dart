import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/game/game.dart';
import 'package:endless_dimension/interface/bar_life_component.dart';
import 'package:endless_dimension/player/knight.dart';

class KnightInterface extends GameInterface {
  @override
  Future<void> onLoad() async {
    add(BarLifeComponent());
    add(InterfaceComponent(
      sprite: Sprite.load('game_pause_button1.png'),
      spriteSelected: Sprite.load('game_pause_button2.png'),
      height: 40,
      width: 40,
      id: 5,
      position: Vector2(150, 20),
      onTapComponent: (bool) {
        if (gameRef.player != null) {
          (gameRef.player as Knight).showEmote();
          (gameRef.player as Knight).setShowPauseMenu(true);
        }
      },
    ));
    add(InterfaceComponent(
      sprite: Sprite.load('player_state_button1.png'),
      spriteSelected: Sprite.load('player_state_button2.png'),
      height: 40,
      width: 40,
      id: 6,
      position: Vector2(200, 20),
      onTapComponent: (bool) {
        if (gameRef.player != null) {
          (gameRef.player as Knight).setShowPlayerState(true);
        }
      },
    ));
    add(InterfaceComponent(
      sprite: Sprite.load('bag_button1.png'),
      spriteSelected: Sprite.load('bag_button2.png'),
      height: 40,
      width: 40,
      id: 7,
      position: Vector2(250, 20),
      onTapComponent: (bool) {
        if (gameRef.player != null) {
          (gameRef.player as Knight).setShowItem(true);
        }
      },
    ));
    return super.onLoad();
  }
}
