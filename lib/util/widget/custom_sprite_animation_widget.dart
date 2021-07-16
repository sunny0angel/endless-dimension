import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class CustomSpriteAnimationWidget extends StatelessWidget {
  final Future<SpriteAnimation> animation;

  const CustomSpriteAnimationWidget({Key? key, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: animation,
      builder: (BuildContext context, AsyncSnapshot<SpriteAnimation> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox.shrink();
        } else {
          return SpriteAnimationWidget(
            animation: snapshot.data ?? SpriteAnimation.empty(),
          );
        }
      },
    );
  }
}
