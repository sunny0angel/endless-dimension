import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class CustomSpriteAnimationWidget extends StatelessWidget {
  final Future<SpriteAnimation> animation;

  const CustomSpriteAnimationWidget({Key key, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: animation,
      builder: (context, data) {
        if (!data.hasData) return SizedBox.shrink();
        return SpriteAnimationWidget(
          animation: data.data,
        );
      },
    );
  }
}