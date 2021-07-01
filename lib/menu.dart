import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/game/game.dart';
import 'package:endless_dimension/util/localization/strings_location.dart';
import 'package:endless_dimension/util/sounds.dart';
import 'package:endless_dimension/util/webWidget/fullscreen_button_web/fullscreen_button.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double screenWidth;
double screenHeight;
bool mute = true;
bool fullscreen = false;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentPosition = 0;
  Timer _timer;
  List<Widget> sprites = [
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced("player/knight_run.png", 6,
          textureWidth: 16, textureHeight: 16),
    ),
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced("player/knight_idle.png", 6,
          textureWidth: 16, textureHeight: 16),
    ),
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced(
        "enemy/goblin_run_right.png",
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
    ),
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced(
        "enemy/goblin_idle.png",
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
    ),
    // Flame.util.animationAsWidget(
    //     Position(80, 80),
    //     FlameAnimation.Animation.sequenced(
    //       "enemy/imp/imp_run_right.png",
    //       4,
    //       textureWidth: 16,
    //       textureHeight: 16,
    //     )),
    // Flame.util.animationAsWidget(
    //     Position(80, 80),
    //     FlameAnimation.Animation.sequenced(
    //       "enemy/imp/imp_idle.png",
    //       4,
    //       textureWidth: 16,
    //       textureHeight: 16,
    //     )),
    // Flame.util.animationAsWidget(
    //   Position(70, 80),
    //   FlameAnimation.Animation.sequenced(
    //     "enemy/boss/boss_run_right.png",
    //     4,
    //     textureWidth: 32,
    //     textureHeight: 36,
    //   ),
    // ),
    // Flame.util.animationAsWidget(
    //   Position(70, 80),
    //   FlameAnimation.Animation.sequenced(
    //     "enemy/boss/boss_idle.png",
    //     4,
    //     textureWidth: 32,
    //     textureHeight: 36,
    //   ),
    // ),
  ];

  @override
  void initState() {
    if (!kIsWeb) {
      Sounds.initialize();
      Sounds.playMenuBackgroundSound();
    }
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    Sounds.stopBackgroundSound();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              kIsWeb
                  ? Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon:
                                Icon(mute ? Icons.volume_off : Icons.volume_up),
                            tooltip:
                                mute ? 'Enable the Music' : 'Close the Music',
                            onPressed: () {
                              setState(() {
                                if (mute) {
                                  mute = false;
                                  Sounds.initialize();
                                  Sounds.playMenuBackgroundSound();
                                } else {
                                  mute = true;
                                }
                              });
                            },
                          ),
                          fullscreenWeb(
                            fullscreen,
                            () {
                              setState(() {
                                if (fullscreen) {
                                  fullscreen = false;
                                } else {
                                  fullscreen = true;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : Text(""),
              Container(
                height: 58 * 2.0,
                width: 283 * 2.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/menu_board.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    getString("game_name"),
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              sprites[currentPosition],
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: 150,
                child: TextButton(
                  child: Text(
                    getString('play_cap'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Game()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 20,
            margin: EdgeInsets.all(20.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        getString('built_with'),
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://github.com/RafaelBarbosatec/bonfire');
                        },
                        child: Text(
                          'Bonfire',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        currentPosition++;
        if (currentPosition > sprites.length - 1) {
          currentPosition = 0;
        }
      });
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
