import 'dart:ui' show Canvas;

import 'package:composition_rendering/core.dart';
import 'package:composition_rendering/scene.dart';
import 'package:composition_rendering/systems.dart';
import 'package:flame/components.dart' show Component;

import 'plugin_system_registry.dart';

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
    super.update(dt);
    systems.updateSystem.update(dt);
    _scene.updateScene(dt);
  }

  @override
  void render(Canvas canvas) {
    systems.renderSystem.render(canvas);
  }
}
