import 'dart:async';
import 'package:flame/components.dart';
import 'package:pixeladventure/pixels_adventures.dart';

enum PlayerState {
  idle,
  running,
}

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  String character;
  Player({position, required this.character}) : super(position: position);
  late final SpriteAnimation idleAnimnation;
  late final SpriteAnimation runningAnimnation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAnimation();
    return super.onLoad();
  }

  void _loadAnimation() {
    idleAnimnation = SpriteAnimation.fromFrameData(
      game.images.fromCache("Main Characters/Ninja Frog/Idle (32x32).png"),
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
    runningAnimnation = _spriteAnimation('Run', 12);
    runningAnimnation = _spriteAnimation('Idle', 11);
    animations = {
      PlayerState.idle: idleAnimnation,
      PlayerState.running: runningAnimnation,
    };

    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache("Main Characters/$character/$state (32x32).png"),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
