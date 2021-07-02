import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/game_controller.dart';
import 'package:flame/image_composition.dart';
import 'package:endless_dimension/enemy/goblin.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:endless_dimension/player/knight.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:endless_dimension/menu.dart';

import '../interface/knight_interface.dart';
import '../menu.dart';
import '../util/dialogs.dart';
import '../util/sounds.dart';

class Game extends StatefulWidget {
  const Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game>
    with WidgetsBindingObserver
    implements GameListener {
  bool showGameOver = false;

  GameController _controller;

  List<List<int>> _mapTitleList;

  @override
  void initState() {
    DungeonMap.objectOnMapList.clear();
    _mapTitleList = DungeonMap.createRandomMapTitleList(20, 20, 1);
    Sounds.initialize();
    Sounds.playGameBackgroundSound();
    WidgetsBinding.instance.addObserver(this);
    _controller = GameController()..setListener(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.resumed:
        Sounds.resumeBackgroundSound();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        Sounds.pauseBackgroundSound();
        break;
      case AppLifecycleState.detached:
        Sounds.stopBackgroundSound();
        break;
    }
  }

  @override
  void dispose() {
    Sounds.stopBackgroundSound();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      DungeonMap.tileSize =
          max(constraints.maxHeight, constraints.maxWidth) / (kIsWeb ? 25 : 22);
      return BonfireWidget(
        joystick: Joystick(
          keyboardEnable: true,
          directional: JoystickDirectional(
            spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
            spriteKnobDirectional: Sprite.load('joystick_knob.png'),
            size: 100,
          ),
          actions: [
            JoystickAction(
              actionId: 0,
              sprite: Sprite.load('joystick_atack.png'),
              spriteBackgroundDirection: Sprite.load('joystick_background.png'),
              align: JoystickActionAlign.BOTTOM_RIGHT,
              size: 50,
              margin: EdgeInsets.only(bottom: 70, right: 40),
            ),
            JoystickAction(
              actionId: 1,
              sprite: Sprite.load('joystick_atack_range.png'),
              spriteBackgroundDirection: Sprite.load('joystick_background.png'),
              align: JoystickActionAlign.BOTTOM_RIGHT,
              size: 50,
              enableDirection: true,
              margin: EdgeInsets.only(bottom: 20, right: 90),
            ),
            JoystickAction(
              actionId: 10,
              sprite: Sprite.load('joystick_atack_range.png'),
              spriteBackgroundDirection: Sprite.load('joystick_background.png'),
              align: JoystickActionAlign.BOTTOM_RIGHT,
              size: 40,
              margin: EdgeInsets.only(bottom: 80, right: 115),
            ),
            JoystickAction(
              actionId: 11,
              sprite: Sprite.load('joystick_atack_range.png'),
              spriteBackgroundDirection: Sprite.load('joystick_background.png'),
              align: JoystickActionAlign.BOTTOM_RIGHT,
              size: 40,
              enableDirection: true,
              margin: EdgeInsets.only(bottom: 25, right: 165),
            ),
          ],
        ),
        player: Knight(
          DungeonMap.getRandomTileVector2(_mapTitleList, 9, false, 100, true),
        ),
        interface: KnightInterface(),
        map: DungeonMap.map(_mapTitleList),
        enemies: DungeonMap.enemies(_mapTitleList),
        decorations: DungeonMap.decorations(_mapTitleList),
        background: BackgroundColorGame(Colors.blueGrey[900]),
        gameController: _controller..setListener(this),
        lightingColorGame: Colors.black.withOpacity(0.75),
        cameraConfig:
            CameraConfig(), // you can change the game zoom here or directly on camera
      );
    });
  }

  @override
  void changeCountLiveEnemies(int count) {
    if (count < 2) {
      _addEnemyInWorld();
    }
  }

  void _addEnemyInWorld() {
    double x = DungeonMap.tileSize * (4 + Random().nextInt(25));
    double y = DungeonMap.tileSize * (5 + Random().nextInt(3));

    _controller.addGameComponent(
      AnimatedObjectOnce(
          animation: SpriteAnimation.load(
              "smoke_explosin.png",
              SpriteAnimationData.sequenced(
                amount: 6,
                stepTime: 0.15,
                textureSize: Vector2(16, 16),
                texturePosition: Vector2(x, y),
              ))),
    );

    _controller.addGameComponent(
      Goblin(
        Vector2(x, y),
      ),
    );
  }

  void _showDialogGameOver() {
    setState(() {
      showGameOver = true;
    });
    Dialogs.showGameOver(
      context,
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Game()),
            (Route<dynamic> route) => false);
      },
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
            (Route<dynamic> route) => false);
      },
    );
  }

  void _showDialogPauseMenu() {
    Dialogs.showGamePauseMenu(
      context,
      () {
        _controller.gameRef.resumeEngine();
        showGameOver = false;
        Navigator.pop(context);
      },
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  void updateGame() {
    if (_controller.player != null && _controller.player.isDead) {
      if (!showGameOver) {
        showGameOver = true;
        _showDialogGameOver();
      }
    }
    if (_controller.player != null) {
      if ((_controller.player as Knight).showPauseMenu) {
        (_controller.player as Knight).setShowPauseMenu(false);
        _controller.gameRef.pauseEngine();
        _showDialogPauseMenu();
      } else if ((_controller.player as Knight).showPlayerState) {
        (_controller.player as Knight).setShowPlayerState(false);
        Dialogs.showPlayerState(context);
      } else if ((_controller.player as Knight).showItem) {
        (_controller.player as Knight).setShowItem(false);
        Dialogs.showItems(context);
      }
    }
  }
}
