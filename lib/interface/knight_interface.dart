import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/interface/bar_life_component.dart';
import 'package:endless_dimension/player/knight.dart';
import 'package:flutter/material.dart';
import 'package:endless_dimension/menu.dart';

class KnightInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(InterfaceComponent(
      sprite: Sprite('game_pause_button1.png'),
      spriteSelected: Sprite('game_pause_button2.png'),
      height: 40,
      width: 40,
      id: 5,
      position: Position(150, 20),
      onTapComponent: () {
        if (gameRef.player != null) {
          (gameRef.player as Knight).showEmote();
          (gameRef.player as Knight).setShowPauseMenu(true);
        }
      },
    ));
    add(InterfaceComponent(
      sprite: Sprite('player_state_button1.png'),
      spriteSelected: Sprite('player_state_button2.png'),
      height: 40,
      width: 40,
      id: 6,
      position: Position(200, 20),
      onTapComponent: () {
        if (gameRef.player != null) {
          (gameRef.player as Knight).setShowPlayerState(true);
        }
      },
    ));
    add(InterfaceComponent(
      sprite: Sprite('bag_button1.png'),
      spriteSelected: Sprite('bag_button2.png'),
      height: 40,
      width: 40,
      id: 7,
      position: Position(screenWidth - 80, 20),
      onTapComponent: () {
        if (gameRef.player != null) {
          (gameRef.player as Knight).setShowItem(true);
        }
      },
    ));
    add(InterfaceComponent(
      sprite: Sprite('items/add_life.png'),
      spriteSelected: Sprite('items/add_life.png'),
      height: 40,
      width: 40,
      id: 8,
      position: Position(screenWidth - 80, screenHeight - 170),
      onTapComponent: () {},
    ));
    add(InterfaceComponent(
      sprite: Sprite('items/add_magic.png'),
      spriteSelected: Sprite('items/add_magic.png'),
      height: 40,
      width: 40,
      id: 9,
      position: Position(screenWidth - 120, screenHeight - 170),
      onTapComponent: () {},
    ));

    super.resize(size);
  }
}
