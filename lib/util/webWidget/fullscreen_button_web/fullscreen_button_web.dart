import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget fullscreenWeb(bool fullscreen, ui.VoidCallback callback) => IconButton(
      icon: Icon(fullscreen ? Icons.fullscreen_exit : Icons.fullscreen),
      tooltip: fullscreen ? 'Exit Full Screen' : 'Full Screen',
      onPressed: () {
        if (fullscreen) {
          document.exitFullscreen();
        } else {
          document.documentElement.requestFullscreen();
        }
        callback;
      },
    );
