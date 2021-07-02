import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/db/database.dart';
import 'package:endless_dimension/map/dungeon_map.dart';

class PotionLife extends GameDecoration with Sensor {
  // double _lifeDistributed = 0;

  PotionLife(Vector2 position, double life)
      : super.withSprite(
          Sprite.load('items/potion_life.png'),
          position: position,
          width: DungeonMap.tileSize * 0.5,
          height: DungeonMap.tileSize * 0.5,
        );

  @override
  void onContact(GameComponent component) {
    final db = DBProvider.db.database;
    if (component is Player) {
      // Timer.periodic(Duration(milliseconds: 100), (timer) {
      //   if (_lifeDistributed >= life) {
      //     timer.cancel();
      //   } else {
      //     _lifeDistributed += 2;
      //     gameRef.player.addLife(5);
      //   }
      // });
      db
          .into(db.playerItems)
          .insert(PlayerItem(itemid: 1, bagindex: 100, cnt: 1));
      remove();
    }
  }
}
