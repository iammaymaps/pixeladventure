import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixeladventure/actor/player.dart';

class Level extends World {
  late TiledComponent level;

  @override
  Future<void> onLoad() async {
    level = await TiledComponent.load('Level-01.tmx', Vector2.all(16));
    add(level);

    final spawanPointsLayer = level.tileMap.getLayer<ObjectGroup>(
      'Spwanpoints',
    );

    for (final spawanPoints in spawanPointsLayer!.objects) {
      switch (spawanPoints.class_) {
        case 'Player':
          final player = Player(
              character: "Mask Dude",
              position: Vector2(
                spawanPoints.x,
                spawanPoints.y,
              ));
          add(player);
          break;
        default:
      }
    }

    return super.onLoad();
  }
}
