import 'dart:ui';

import 'package:composition_rendering/batch.dart';
import 'package:flame/components.dart';

abstract class FlameBatchComponent extends Component {
  EngineBatch batch;
  Rect? cullRect;

  FlameBatchComponent() : batch = EngineBatch();

  FlameBatchComponent.fromEngineBatch(
    this.batch, {
    this.cullRect,
  });

  void beginBatch();

  void drawSprite(Sprite sprite, {double x = 0, double y = 0}) {
    batch.drawImageFromData(sprite.image, sprite.src, 1, 0, x, y, sprite.paint.color.value);
  }

  void drawSpriteFromComponents(
    Sprite sprite, {
    double rotation = 0,
    double scale = 1,
    double? anchorX,
    double? anchorY,
    double x = 0,
    double y = 0,
  }) {
    batch.drawImageFromComponents(
        image: sprite.image,
        rect: sprite.src,
        rotation: rotation,
        scale: scale,
        anchorX: anchorX ?? -sprite.src.left + sprite.src.width / 2.0,
        anchorY: anchorY ?? -sprite.src.top + sprite.src.height / 2.0,
        translateX: x,
        translateY: y);
  }

  @override
  void render(Canvas canvas) {
    batch.beginBatch(canvas, cullRect: cullRect);
    beginBatch();
    batch.endBatch();
  }
}
