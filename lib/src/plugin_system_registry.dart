import 'dart:ui' show Image;

import 'package:composition_rendering/systems.dart';
import 'package:flame/flame.dart';

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
