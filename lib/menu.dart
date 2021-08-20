import 'dart:async' as async;
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/game/game.dart';
import 'package:endless_dimension/util/animations/player_sprite_sheet.dart';
import 'package:endless_dimension/util/animations/enemy_sprite_sheet.dart';
import 'package:endless_dimension/util/function/common_func.dart';
import 'package:endless_dimension/util/widget/dialogs.dart';
import 'package:endless_dimension/util/localization/strings_location.dart';
import 'package:endless_dimension/util/sounds.dart';
import 'package:endless_dimension/util/widget/bgm_mute_button.dart';
import 'package:endless_dimension/util/widget/custom_sprite_animation_widget.dart';
import 'package:endless_dimension/util/widget/full_screen_button.dart';
import 'package:endless_dimension/util/widget/markdown_blog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

late double initHeight;
late double initWidth;
late double scalingRate = 1;
late bool fullscreenDisabled = false;

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
    // 1440 x 3120
    if (max(window.physicalSize.width, window.physicalSize.height) <= 3120 ||
        min(window.physicalSize.width, window.physicalSize.height) <= 1440) {
      scalingRate = 0.7;
    } else {
      scalingRate = 1;
    }
    if (kIsWeb && BrowserType.safari == getBrowserType()) mute = true;
    if (kIsWeb && BrowserType.safari == getBrowserType() && Platform.isIOS)
      fullscreenDisabled = true;
    Sounds.bgmType = BgmType.menu;
    Sounds.initialize();
    Sounds.playBackgroundSound();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    Sounds.disposeBackgroundSound();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initHeight = MediaQuery.of(context).size.height;
    initWidth = MediaQuery.of(context).size.width;
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: OverflowBox(
            maxHeight: 465 * scalingRate,
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 58 *
                            2.0 *
                            scalingRate *
                            ((scalingRate != 1 && initHeight > initWidth)
                                ? 0.8
                                : 1),
                        width: 283 *
                            2.0 *
                            scalingRate *
                            ((scalingRate != 1 && initHeight > initWidth)
                                ? 0.8
                                : 1),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/menu_board.png'),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            getString("game_name"),
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 50.0 *
                                    scalingRate *
                                    ((scalingRate != 1 &&
                                            initHeight > initWidth)
                                        ? 0.8
                                        : 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0 * scalingRate,
                      ),
                      if (sprites.isNotEmpty)
                        SizedBox(
                          height: 100 * scalingRate,
                          width: 100 * scalingRate,
                          child: CustomSpriteAnimationWidget(
                            animation: sprites[currentPosition],
                          ),
                        ),
                      SizedBox(
                        height: 10.0 * scalingRate,
                      ),
                      SizedBox(
                        width: 150 * scalingRate,
                        child: TextButton(
                          child: Text(
                            getString('play_cap'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0 * scalingRate,
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
                        height: 7.0 * scalingRate,
                      ),
                      SizedBox(
                        width: 150 * scalingRate,
                        child: TextButton(
                          child: Text(
                            getString('blog'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0 * scalingRate,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarkdownBlog()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7.0 * scalingRate,
                      ),
                      SizedBox(
                        width: 150 * scalingRate,
                        child: TextButton(
                          child: Text(
                            getString('contact_me'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0 * scalingRate,
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
              ),
              Positioned(
                top: initHeight / 6,
                child: kIsWeb
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BgmMuteButton(),
                          if (!fullscreenDisabled) FullscreenButton(),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
            ]),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 20 * scalingRate,
              margin: EdgeInsets.all(15.0 * scalingRate),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "using: ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0 * scalingRate),
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
                              fontFamily: 'Normal',
                              fontSize: 12.0 * scalingRate,
                            ),
                          ),
                        ),
                        Text(
                          " & ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0 * scalingRate),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL('https://github.com/flame-engine/flame');
                          },
                          child: Text(
                            'Flame',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontFamily: 'Normal',
                              fontSize: 12.0 * scalingRate,
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
