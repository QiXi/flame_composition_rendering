import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_composition_rendering/flame_composition_rendering.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
    GameWidget(
      game: ExampleLauncher(),
    ),
  );
}

class ExampleLauncher extends BaseGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll(['crab.png']);
    await add(SpriteBatchComponent());
  }

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);
}

class SpriteBatchComponent extends FlameBatchComponent {
  late final image;
  late final sprite;

  @override
  Future<void>? onLoad() {
    image = Flame.images.fromCache('crab.png');
    sprite = Sprite(image);
  }

  @override
  void beginBatch() {
    drawSprite(sprite, x: 100, y: 200);
    drawSprite(sprite, x: 200, y: 200);
    drawSprite(sprite, x: 300, y: 200);
    drawSpriteFromComponents(sprite, x: 400, y: 100, rotation: 0.4, scale: 0.6);
  }
}
