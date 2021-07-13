import 'dart:ui' show Canvas, Image;

import 'package:composition_rendering/core.dart';
import 'package:composition_rendering/scene.dart';
import 'package:composition_rendering/systems.dart';
import 'package:flame/components.dart' show Component;
import 'package:flame/flame.dart';

class FlamePluginComponent extends Component with Registry {
  static final PluginSystemRegistry registry = PluginSystemRegistry();

  late final Scene _scene;

  FlamePluginComponent() {
    SystemRegistry.instance = registry;
    changePriorityWithoutResorting(50);
  }

  set scene(Scene scene) {
    _scene = scene;
  }

  @override
  Future<void>? onLoad() async {
    _scene.init();
  }

  void onResize(Vector2 canvasSize) {
    parameters.setViewSize(canvasSize.x, canvasSize.y);
  }

  @override
  void update(double dt) {
    systems.updateSystem.update(dt);
    _scene.updateScene(dt);
  }

  @override
  void render(Canvas canvas) {
    systems.renderSystem.render(canvas);
  }
}

class PluginSystemRegistry extends SystemRegistry {
  PluginSystemRegistry() : super(parameters: Parameters(), assetSystem: PluginAssetSystem());
}

class PluginAssetSystem extends AssetSystem {
  @override
  Image? getImageFromCache(String fileName) {
    return Flame.images.fromCache(fileName);
  }

  @override
  Future<Image?> loadImage(String fileName) {
    return Flame.images.load(fileName);
  }

  @override
  Future<String> readFile(String fileName) {
    return Flame.assets.readFile(fileName);
  }

  @override
  Future<Map<String, dynamic>> readJson(String fileName) {
    return Flame.assets.readJson(fileName);
  }
}
