import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/decoration/barrel_dragable.dart';
import 'package:endless_dimension/decoration/chest.dart';
import 'package:endless_dimension/decoration/spikes.dart';
import 'package:endless_dimension/decoration/torch.dart';
import 'package:endless_dimension/enemy/goblin.dart';
import 'package:endless_dimension/enemy/tower_rotation.dart';
import 'package:flutter/cupertino.dart';

class DungeonMap {
  static double tileSize = 45;

  static TileModel setWallTile(double x, double y) {
    return _createTileWithCollisions('tile/wall.png', x, y);
  }

  static TileModel setWallTopTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_top.png', x, y);
  }

  static TileModel setWallBottomTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_bottom.png', x, y);
  }

  static TileModel setWallLeftTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_left.png', x, y);
  }

  static TileModel setWallRightTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_right.png', x, y);
  }

  static TileModel setWallBottomLeftTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_top_inner_left.png', x, y);
  }

  static TileModel setWallBottomRightTile(double x, double y) {
    return _createTileWithCollisions('tile/wall_top_inner_right.png', x, y);
  }

  static TileModel setRandomFloorTile(double x, double y) {
    return _creatTile(_randomFloor(), x, y);
  }

  static TileModel setEmptyTile(double x, double y) {
    return _creatTile('tile/empty.png', x, y);
  }

  static TileModel createMapTile(int tileType, double x, double y) {
    switch (tileType) {
      case 1:
        return setWallTile(x, y);
      case 2:
        return setWallTopTile(x, y);
      case 3:
        return setWallBottomTile(x, y);
      case 4:
        return setWallLeftTile(x, y);
      case 5:
        return setWallRightTile(x, y);
      case 6:
        return setWallBottomLeftTile(x, y);
      case 7:
        return setWallBottomRightTile(x, y);
      case 9:
        return setRandomFloorTile(x, y);
      default:
        return setEmptyTile(x, y);
    }
  }

  static List<List<int>> createRandomMapTitleList(
      int initWidth, int initHeight, int randomMax) {
    List<List<int>> mapTitleList = [];
    int width = initWidth + Random().nextInt(randomMax);
    int height = initHeight + Random().nextInt(randomMax);
    // create map list and set walls
    for (int i = 0; i < height; i++) {
      List<int> tileRow = [];
      for (int j = 0; j < width; j++) {
        if (i == 1) {
          if (j == 0) {
            tileRow.add(4);
          } else if (j == width - 1) {
            tileRow.add(5);
          } else {
            tileRow.add(1);
          }
        } else if (i == 0) {
          if (j == 0) {
            tileRow.add(6);
          } else if (j == width - 1) {
            tileRow.add(7);
          } else {
            tileRow.add(3);
          }
        } else if (i == height - 1) {
          if (j == 0 || j == width - 1) {
            tileRow.add(0);
          } else {
            tileRow.add(2);
          }
        } else {
          if (j == 0) {
            tileRow.add(4);
          } else if (j == width - 1) {
            tileRow.add(5);
          } else if (Random().nextInt(100) <= 30) {
            tileRow.add(1);
          } else {
            tileRow.add(9);
          }
        }
      }
      mapTitleList.add(tileRow);
    }

    _mapOptimize(mapTitleList);

    // print(mapTitleList.toString());
    return mapTitleList;
  }

  static void _mapOptimize(List<List<int>> mapTitleList) {
    // walls Vector2 optimize
    int cnt = 5;
    while (cnt > 0) {
      for (int i = 3; i < mapTitleList.length - 2; i++) {
        for (int j = 2; j < mapTitleList[0].length - 2; j++) {
          int tmpTileType = mapTitleList[i][j];
          int tmpTileTypeUp = mapTitleList[i - 1][j];
          int tmpTileTypeLeft = mapTitleList[i][j - 1];
          int tmpTileTypeRight = mapTitleList[i][j + 1];
          int tmpTileTypeDown = mapTitleList[i + 1][j];
          List<int> tmpTileType8DSurround = [
            mapTitleList[i - 1][j - 1],
            tmpTileTypeUp,
            mapTitleList[i - 1][j + 1],
            tmpTileTypeLeft,
            tmpTileTypeRight,
            mapTitleList[i + 1][j - 1],
            tmpTileTypeDown,
            mapTitleList[i + 1][j + 1]
          ];
          int wallTile8DSurroundCnt =
              tmpTileType8DSurround.where((e) => e == 1).length;
          if (tmpTileType == 1 && wallTile8DSurroundCnt >= 3)
            mapTitleList[i][j] = 9;
          List<int> tmpTileType4DSurround = [
            tmpTileTypeUp,
            tmpTileTypeLeft,
            tmpTileTypeRight,
            tmpTileTypeDown
          ];
          int wallTile4DSurroundCnt =
              tmpTileType4DSurround.where((e) => e == 1).length;
          if (tmpTileType == 9) {
            if (wallTile4DSurroundCnt == 4 ||
                (tmpTileTypeUp == 1 && tmpTileTypeLeft == 1) ||
                (tmpTileTypeDown == 1 && tmpTileTypeRight == 1) ||
                (tmpTileTypeDown == 1 && tmpTileTypeLeft == 1) ||
                (tmpTileTypeUp == 1 && tmpTileTypeRight == 1))
              mapTitleList[i][j] = 1;
          }
          if (tmpTileType == 1 && wallTile4DSurroundCnt == 0)
            mapTitleList[i][j] = 9;
        }
      }
      cnt--;
    }

    for (int i in [2, mapTitleList.length - 2]) {
      for (int j in [1, mapTitleList[0].length - 2]) {
        int tmpTileType = mapTitleList[i][j];
        int tmpTileTypeUp = mapTitleList[i - 1][j];
        int tmpTileTypeLeft = mapTitleList[i][j - 1];
        int tmpTileTypeRight = mapTitleList[i][j + 1];
        int tmpTileTypeDown = mapTitleList[i + 1][j];
        List<int> tmpTileType4DSurround = [
          tmpTileTypeUp,
          tmpTileTypeLeft,
          tmpTileTypeRight,
          tmpTileTypeDown
        ];
        int wallTile4DSurroundCnt =
            tmpTileType4DSurround.where((e) => e != 9).length;
        if (tmpTileType == 9 && wallTile4DSurroundCnt >= 3)
          mapTitleList[i][j] = 1;
      }
    }
  }

  static MapWorld map(List<List<int>> mapTitleList) {
    List<TileModel> tileList = [];
    for (int i = 0; i < mapTitleList.length; i++) {
      for (int j = 0; j < mapTitleList[0].length; j++) {
        tileList
            .add(createMapTile(mapTitleList[i][j], j.toDouble(), i.toDouble()));
      }
    }

    return MapWorld(tileList, tileSizeToUpdate: tileSize);
  }

  static TileModel _createTileWithCollisions(
      String spritePath, double x, double y) {
    return TileModel(
      sprite: TileModelSprite(path: spritePath),
      x: x,
      y: y,
      collisions: [CollisionArea.rectangle(size: Size(tileSize, tileSize))],
      width: tileSize,
      height: tileSize,
    );
  }

  static TileModel _creatTile(String spritePath, double x, double y) {
    return TileModel(
      sprite: TileModelSprite(path: spritePath),
      x: x,
      y: y,
      width: tileSize,
      height: tileSize,
    );
  }

  static List<Point<int>> objectOnMapList = [];

  static List<GameDecoration> decorations(List<List<int>> mapTitleList) {
    int cnt = (mapTitleList.length * mapTitleList[0].length / 50).truncate();
    List<GameDecoration> gl = [];
    int tmpCnt = cnt;
    while (tmpCnt > 0) {
      gl.add(Spikes(getRandomTileVector2(mapTitleList, 9, true, 0, false)));
      tmpCnt--;
    }
    tmpCnt = (cnt / 2).truncate();
    while (tmpCnt > 0) {
      gl.add(BarrelDraggable(
          getRandomTileVector2(mapTitleList, 9, true, 0, true)));
      gl.add(GameDecorationWithCollision.withSprite(
        Sprite.load('items/barrel.png'),
        getRandomTileVector2(mapTitleList, 9, true, 0, true),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize / 1.5, tileSize / 1.5))
        ],
      ));
      gl.add(Chest(getRandomTileVector2(mapTitleList, 9, true, 0, false)));
      gl.add(GameDecorationWithCollision.withSprite(
        Sprite.load('items/table.png'),
        getRandomTileVector2(mapTitleList, 9, true, 0, true),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize * 0.8, tileSize))
        ],
      ));

      tmpCnt--;
    }
    tmpCnt = cnt;
    while (tmpCnt > 0) {
      gl.add(Torch(getRandomTileVector2(mapTitleList, 1, true, 0, false)));
      gl.add(GameDecoration.withSprite(
        Sprite.load('items/prisoner.png'),
        position: getRandomTileVector2(mapTitleList, 1, true, 0, false),
        width: tileSize,
        height: tileSize,
      ));
      gl.add(GameDecoration.withSprite(
        Sprite.load('items/flag_red.png'),
        position: getRandomTileVector2(mapTitleList, 1, true, 0, false),
        width: tileSize,
        height: tileSize,
      ));
      tmpCnt--;
    }
    return gl;
  }

  static List<Enemy> enemies(
      List<List<int>> mapTitleList, Vector2Rect knightPosition) {
    int cnt = (mapTitleList.length * mapTitleList[0].length / 50).truncate();
    int cnt1 = (cnt / 3).truncate();
    List<Enemy> el = [];

    while (cnt > 0) {
      var position = getRandomTileVector2(mapTitleList, 9, true, 0, true);
      if (position.distanceTo(knightPosition.position) > tileSize * 10) {
        el.add(Goblin(position));
        cnt--;
      }
    }

    while (cnt1 > 0) {
      var position = getRandomTileVector2(mapTitleList, 9, true, 0, true);
      if (position.distanceTo(knightPosition.position) > tileSize * 10) {
        el.add(TowerRotation(position));
        cnt1--;
      }
    }
    return el;
  }

  static String _randomFloor() {
    int p = Random().nextInt(6);
    switch (p) {
      case 0:
        return 'tile/floor_1.png';
        break;
      case 1:
        return 'tile/floor_2.png';
        break;
      case 2:
        return 'tile/floor_3.png';
        break;
      case 3:
        return 'tile/floor_4.png';
        break;
      case 4:
        return 'tile/floor_3.png';
        break;
      case 5:
        return 'tile/floor_4.png';
        break;
      default:
        return 'tile/floor_1.png';
    }
  }

  static Vector2 getRelativeTileVector2(int x, int y) {
    return Vector2(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }

  static Vector2 getRandomTileVector2(
      List<List<int>> mapTitleList,
      int onTileType,
      bool randomOrOnCorner,
      int rangeFromCorner,
      bool collision) {
    int count = 0;
    int x = 0;
    int y = 0;
    if (randomOrOnCorner) {
      while (true) {
        x = Random().nextInt(mapTitleList.length);
        y = Random().nextInt(mapTitleList[0].length);

        if (mapTitleList[x][y] == onTileType) {
          if (collision && onTileType == 9) {
            List<int> tmpTileTypeSurround = [
              mapTitleList[x - 1][y - 1],
              mapTitleList[x - 1][y],
              mapTitleList[x - 1][y + 1],
              mapTitleList[x][y - 1],
              mapTitleList[x][y + 1],
              mapTitleList[x + 1][y - 1],
              mapTitleList[x + 1][y],
              mapTitleList[x + 1][y + 1]
            ];
            if (tmpTileTypeSurround.where((e) => e != 9).length >= 3) continue;
          }
          Point p = Point(x, y);
          if (!objectOnMapList.contains(p)) {
            objectOnMapList.add(Point(x, y));
          } else {
            continue;
          }
          break;
        }
      }
    } else {
      switch (Random().nextInt(3)) {
        // start from left up
        case 0:
          outloop:
          for (int i = 0; i < mapTitleList.length - 1; i++) {
            for (int j = 0; j < mapTitleList[0].length - 1; j++) {
              int tmpTileType = mapTitleList[i][j];
              if (tmpTileType == onTileType &&
                  (Random().nextInt(100) <= 30 ||
                      (rangeFromCorner == 0
                          ? false
                          : count > rangeFromCorner))) {
                x = i;
                y = j;
                break outloop;
              } else {
                count++;
              }
            }
          }
          break;
        // start from right up
        case 1:
          outloop:
          for (int i = 0; i < mapTitleList.length - 1; i++) {
            for (int j = mapTitleList[0].length - 1; j >= 0; j--) {
              int tmpTileType = mapTitleList[i][j];
              if (tmpTileType == onTileType &&
                  (Random().nextInt(100) <= 30 ||
                      (rangeFromCorner == 0
                          ? false
                          : count > rangeFromCorner))) {
                x = i;
                y = j;
                break outloop;
              } else {
                count++;
              }
            }
          }
          break;
        // start from left down
        case 2:
          outloop:
          for (int i = mapTitleList.length - 1; i >= 0; i--) {
            for (int j = 0; j < mapTitleList[0].length - 1; j++) {
              int tmpTileType = mapTitleList[i][j];
              if (tmpTileType == onTileType &&
                  (Random().nextInt(100) <= 30 ||
                      (rangeFromCorner == 0
                          ? false
                          : count > rangeFromCorner))) {
                x = i;
                y = j;
                break outloop;
              } else {
                count++;
              }
            }
          }
          break;
        // start from right down
        default:
          outloop:
          for (int i = mapTitleList.length - 1; i >= 0; i--) {
            for (int j = mapTitleList[0].length - 1; j >= 0; j--) {
              int tmpTileType = mapTitleList[i][j];
              if (tmpTileType == onTileType &&
                  (Random().nextInt(100) <= 30 ||
                      (rangeFromCorner == 0
                          ? false
                          : count > rangeFromCorner))) {
                x = i;
                y = j;
                break outloop;
              } else {
                count++;
              }
            }
          }
      }
    }
    // print(x.toString() + '  +  ' + y.toString());
    return Vector2(y * tileSize, x * tileSize);
  }
}
