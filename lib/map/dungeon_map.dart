import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/decoration/barrel_dragable.dart';
import 'package:endless_dimension/decoration/chest.dart';
import 'package:endless_dimension/decoration/spikes.dart';
import 'package:endless_dimension/decoration/torch.dart';
import 'package:endless_dimension/enemy/goblin.dart';
import 'package:endless_dimension/enemy/tower_rotation.dart';
import 'package:flame/position.dart';

class DungeonMap {
  static double tileSize = 45;
  static final Sprite wall = Sprite('tile/wall.png');
  static final Sprite wallTop = Sprite('tile/wall_top.png');
  static final Sprite wallBottom = Sprite('tile/wall_bottom.png');
  static final Sprite wallLeft = Sprite('tile/wall_left.png');
  static final Sprite wallRight = Sprite('tile/wall_right.png');
  static final Sprite wallBottomLeft = Sprite('tile/wall_top_inner_left.png');
  static final Sprite wallBottomRight = Sprite('tile/wall_top_inner_right.png');
  static final Sprite floor_1 = Sprite('tile/floor_1.png');
  static final Sprite floor_2 = Sprite('tile/floor_2.png');
  static final Sprite floor_3 = Sprite('tile/floor_3.png');
  static final Sprite floor_4 = Sprite('tile/floor_4.png');

  static Tile setWallTile(Position position) {
    return TileWithCollision(
      wall,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallTopTile(Position position) {
    return TileWithCollision(
      wallTop,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallBottomTile(Position position) {
    return TileWithCollision(
      wallBottom,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallLeftTile(Position position) {
    return TileWithCollision(
      wallLeft,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallRightTile(Position position) {
    return TileWithCollision(
      wallRight,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallBottomLeftTile(Position position) {
    return TileWithCollision(
      wallBottomLeft,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setWallBottomRightTile(Position position) {
    return TileWithCollision(
      wallBottomRight,
      position,
      collisions: [CollisionArea.fromSize(tileSize)],
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setRandomFloorTile(Position position) {
    return Tile.fromSprite(
      randomFloor(),
      position,
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile setEmptyTile(Position position) {
    return Tile(
      '',
      position,
      width: tileSize,
      height: tileSize,
    );
  }

  static Tile createMapTile(int tileType, Position position) {
    switch (tileType) {
      case 1:
        return setWallTile(position);
      case 2:
        return setWallTopTile(position);
      case 3:
        return setWallBottomTile(position);
      case 4:
        return setWallLeftTile(position);
      case 5:
        return setWallRightTile(position);
      case 6:
        return setWallBottomLeftTile(position);
      case 7:
        return setWallBottomRightTile(position);
      case 9:
        return setRandomFloorTile(position);
      default:
        return setEmptyTile(position);
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
    // walls position optimize
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
    List<Tile> tileList = [];
    for (int i = 0; i < mapTitleList.length; i++) {
      for (int j = 0; j < mapTitleList[0].length; j++) {
        tileList.add(createMapTile(
            mapTitleList[i][j], Position(j.toDouble(), i.toDouble())));
      }
    }

    return MapWorld(tileList);
  }

  static List<Point<int>> objectOnMapList = [];

  static List<GameDecoration> decorations(List<List<int>> mapTitleList) {
    int cnt = (mapTitleList.length * mapTitleList[0].length / 50).truncate();
    List<GameDecoration> gl = [];
    int tmpCnt = cnt;
    while (tmpCnt > 0) {
      gl.add(Spikes(getRandomTilePosition(mapTitleList, 9, true, 0, false)));
      tmpCnt--;
    }
    tmpCnt = (cnt / 2).truncate();
    while (tmpCnt > 0) {
      gl.add(BarrelDraggable(
          getRandomTilePosition(mapTitleList, 9, true, 0, true)));
      gl.add(GameDecorationWithCollision(
        Sprite('items/barrel.png'),
        getRandomTilePosition(mapTitleList, 9, true, 0, true),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea(
            width: tileSize / 1.5,
            height: tileSize / 1.5,
          )
        ],
      ));
      gl.add(Chest(getRandomTilePosition(mapTitleList, 9, true, 0, false)));
      gl.add(GameDecorationWithCollision(
        Sprite('items/table.png'),
        getRandomTilePosition(mapTitleList, 9, true, 0, true),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea(
            height: tileSize * 0.8,
            width: tileSize,
          ),
        ],
      ));

      tmpCnt--;
    }
    tmpCnt = cnt;
    while (tmpCnt > 0) {
      gl.add(Torch(getRandomTilePosition(mapTitleList, 1, true, 0, false)));
      gl.add(GameDecoration.sprite(
        Sprite('items/prisoner.png'),
        position: getRandomTilePosition(mapTitleList, 1, true, 0, false),
        width: tileSize,
        height: tileSize,
      ));
      gl.add(GameDecoration.sprite(
        Sprite('items/flag_red.png'),
        position: getRandomTilePosition(mapTitleList, 1, true, 0, false),
        width: tileSize,
        height: tileSize,
      ));
      tmpCnt--;
    }
    return gl;
  }

  static List<Enemy> enemies(List<List<int>> mapTitleList) {
    int cnt = (mapTitleList.length * mapTitleList[0].length / 50).truncate();
    int cnt1 = (cnt / 3).truncate();
    List<Enemy> el = [];

    while (cnt > 0) {
      el.add(Goblin(getRandomTilePosition(mapTitleList, 9, true, 0, true)));
      cnt--;
    }

    while (cnt1 > 0) {
      el.add(
          TowerRotation(getRandomTilePosition(mapTitleList, 9, true, 0, true)));
      cnt1--;
    }
    return el;
  }

  static Sprite randomFloor() {
    int p = Random().nextInt(6);
    switch (p) {
      case 0:
        return floor_1;
        break;
      case 1:
        return floor_2;
        break;
      case 2:
        return floor_3;
        break;
      case 3:
        return floor_4;
        break;
      case 4:
        return floor_3;
        break;
      case 5:
        return floor_4;
        break;
      default:
        return floor_1;
    }
  }

  static Position getRelativeTilePosition(int x, int y) {
    return Position(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }

  static Position getRandomTilePosition(
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
    print(x.toString() + '  +  ' + y.toString());
    return Position(y * tileSize, x * tileSize);
  }
}
