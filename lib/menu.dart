import 'dart:async' as async;

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/game/game.dart';
import 'package:endless_dimension/util/animations/player_sprite_sheet.dart';
import 'package:endless_dimension/util/animations/enemy_sprite_sheet.dart';
import 'package:endless_dimension/util/dialogs.dart';
import 'package:endless_dimension/util/localization/strings_location.dart';
import 'package:endless_dimension/util/sounds.dart';
import 'package:endless_dimension/util/widget/custom_sprite_animation_widget.dart';
import 'package:endless_dimension/util/widget/fullscreen_web_callback/fullscreen_callback.dart';
import 'package:endless_dimension/util/widget/markdown_blog.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

bool mute = true;
bool fullscreen = false;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool showSplash = true;
  int currentPosition = 0;
  async.Timer? _timer;
  List<Future<SpriteAnimation>> sprites = [
    PlayerSpriteSheet.idleRight,
    PlayerSpriteSheet.runRight,
    EnemySpriteSheet.idleRight,
    EnemySpriteSheet.runRight
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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (kIsWeb)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
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
                              Sounds.playMenuBackgroundSound();
                            } else {
                              mute = true;
                              FlameAudio.bgm.audioPlayer?.setVolume(0);
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          fullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                          color: Colors.white,
                        ),
                        tooltip:
                            fullscreen ? 'Exit Full Screen' : 'Full Screen',
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
                      ),
                    ],
                  ),
                if (kIsWeb)
                  SizedBox(
                    height: 40.0,
                  ),
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
                if (sprites.isNotEmpty)
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CustomSpriteAnimationWidget(
                      animation: sprites[currentPosition],
                    ),
                  ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                    child: Text(
                      getString('play_cap'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                    child: Text(
                      getString('blog'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarkdownBlog()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                    child: Text(
                      getString('contact_me'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    onPressed: () {
                      Dialogs.showContactMe(context, () {});
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
                          getString('using'),
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL('https://github.com/RafaelBarbosatec');
                          },
                          child: Text(
                            'Bonfire',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontFamily: 'Normal',
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
        ));
  }

  void startTimer() {
    _timer = async.Timer.periodic(Duration(seconds: 2), (timer) {
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
