import 'package:endless_dimension/util/function/common_func.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool fullscreen = false;

class FullscreenButton extends StatefulWidget {
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
          } else {
            fullscreen = true;
          }
        });
      },
    );
  }
}
