<p align="center">
<a title="Pub" href="https://pub.dartlang.org/packages/flame_composition_rendering" ><img alt="Pub Version" src="https://img.shields.io/pub/v/flame_composition_rendering?color=blue&style=for-the-badge"></a>
<a title="Pub" href="https://pub.dartlang.org/packages/composition_rendering" ><img alt="Pub Version" src="https://img.shields.io/pub/v/composition_rendering?label=composition_rendering&style=for-the-badge"></a>
</p>

## Usage FlamePluginComponent

A simple usage example:

```dart
import 'package:composition_rendering/scene.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_composition_rendering/flame_plugin.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(
      game: ExampleLauncher(),
    ),
  );
}

class ExampleLauncher extends BaseGame {
  final FlamePluginComponent plugin = FlamePluginComponent();

  ExampleLauncher() {
    plugin.scene = GameScene();
  }

  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll([
      'bg.jpg',
    ]);
    await add(plugin);
  }
}

class GameScene extends Scene {
  @override
  void init() {
    // your play scene
  }
}
```


## Usage SpriteBatchComponent

Alternative SpriteBatch for Flame. Rendering three sprites in one call [Canvas.drawRawAtlas](https://api.flutter.dev/flutter/dart-ui/Canvas/drawRawAtlas.html)

```dart
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
```


## Support

You can support the development of libraries for creating multiplatform games in Flutter:

[![Patreon](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/flutterio)
