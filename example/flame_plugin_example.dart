import 'package:composition_rendering/scene.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_composition_rendering/flame_composition_rendering.dart';
import 'package:flutter/widgets.dart';

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

class ExampleLauncher extends FlameGame {
  final FlamePluginComponent plugin = FlamePluginComponent();
  final GameScene gameScene = GameScene();

  ExampleLauncher() {
    plugin.scene = gameScene;
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
    //add(sprite)
  }
}
