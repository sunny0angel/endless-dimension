import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sounds.dart';

bool mute = true;

class BgmMuteButton extends StatefulWidget {
  @override
  _BgmMuteButtonState createState() => _BgmMuteButtonState();
}

class _BgmMuteButtonState extends State<BgmMuteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        mute ? Icons.volume_off : Icons.volume_up,
        color: Colors.white,
      ),
      tooltip: mute ? 'Enable the Music' : 'Close the Music',
      onPressed: () {
        setState(() {
          if (mute) {
            mute = false;
            Sounds.initialize();
            Sounds.playBackgroundSound();
          } else {
            mute = true;
            Sounds.stopBackgroundSound();
          }
        });
      },
    );
  }
}
