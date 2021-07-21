import 'dart:ui';

import 'package:endless_dimension/util/callback/fullscreen_web_callback/fullscreen_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool fullscreen = false;

double initHeight = window.physicalSize.height / 1.5;
double initWidth = window.physicalSize.width / 1.5;

class FullscreenButton extends StatefulWidget {
  VoidCallback? callback;

  FullscreenButton({VoidCallback? callback}) {
    this.callback = callback;
  }

  @override
  _FullscreenButtonState createState() => _FullscreenButtonState();
}

class _FullscreenButtonState extends State<FullscreenButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        fullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
        color: Colors.white,
      ),
      tooltip: fullscreen ? 'Exit Full Screen' : 'Full Screen',
      onPressed: () {
        fullscreenWebCallback(fullscreen);
        setState(() {
          if (fullscreen) {
            fullscreen = false;
            initHeight = window.physicalSize.height / 1.8;
            initWidth = window.physicalSize.width / 1.8;
          } else {
            fullscreen = true;
            initHeight = window.physicalSize.height / 1.03;
            initWidth = window.physicalSize.width / 1.13;
          }
        });
        widget.callback?.call();
      },
    );
  }
}
