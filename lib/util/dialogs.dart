import 'package:endless_dimension/menu.dart';
import 'package:endless_dimension/util/localization/strings_location.dart';
import 'package:endless_dimension/util/widget/custom_sprite_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radar_chart/radar_chart.dart';

import 'dart:math';

import 'animations/player_sprite_sheet.dart';

class Dialogs {
  static void showGameOver(
      BuildContext context, VoidCallback playAgain, VoidCallback goBackToMenu) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/game_over.png',
                height: 100,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: playAgain,
                child: Text(
                  getString('play_again_cap'),
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              TextButton(
                onPressed: goBackToMenu,
                child: Text(
                  getString('go_back_to_menu'),
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void showGamePauseMenu(
      BuildContext context, VoidCallback resume, VoidCallback goBackToMenu) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                getString('game_pause_menu'),
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextButton(
                onPressed: resume,
                child: Text(
                  getString('resume'),
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              TextButton(
                onPressed: goBackToMenu,
                child: Text(
                  getString('go_back_to_menu'),
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static void showItems(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showPlayerState(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: CustomSpriteAnimationWidget(
                        animation: PlayerSpriteSheet.idleRight),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/items/item_frame.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                        ),
                        onPressed: () {},
                        child: Image(
                          image:
                              AssetImage('assets/images/items/potion_life.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 40.0,
              ),
              RadarChart(
                length: 5,
                radius: 100,
                initialAngle: pi * 3 / 10,
                backgroundColor: Colors.white.withOpacity(0.5),
                borderStroke: 2,
                borderColor: Colors.white.withOpacity(0.7),
                radialStroke: 2,
                radialColor: Colors.black.withOpacity(0.6),
                vertices: [
                  PreferredSize(
                    child: Text(
                      'WIND',
                      style: TextStyle(
                        fontFamily: GoogleFonts.vt323().fontFamily,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    preferredSize: Size(25, 0),
                  ),
                  PreferredSize(
                    child: Text(
                      'EARTH',
                      style: TextStyle(
                        fontFamily: GoogleFonts.vt323().fontFamily,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    preferredSize: Size(27.5, 0),
                  ),
                  PreferredSize(
                    child: Text(
                      'FIRE',
                      style: TextStyle(
                        fontFamily: GoogleFonts.vt323().fontFamily,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    preferredSize: Size(0, 0),
                  ),
                  PreferredSize(
                    child: Text(
                      'WATER',
                      style: TextStyle(
                        fontFamily: GoogleFonts.vt323().fontFamily,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    preferredSize: Size(27.5, 0),
                  ),
                  PreferredSize(
                    child: Text(
                      'METAL',
                      style: TextStyle(
                        fontFamily: GoogleFonts.vt323().fontFamily,
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    preferredSize: Size(55, 0),
                  ),
                ],
                radars: [
                  // TODO add radius parameter to _RadarTilePainter()
                  RadarTile(
                    values: [0.4, 0.8, 0.65, 0.7, 0.3],
                    borderStroke: 2,
                    borderColor: Colors.black.withOpacity(0.6),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCongratulations(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  getString('congratulations'),
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    getString('thanks'),
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                  child: Text("OK",
                      style: TextStyle(color: Colors.white, fontSize: 17.0)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Menu()),
                      (Route<dynamic> route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void showContactMe(BuildContext context, VoidCallback resume) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'CONTACT INFORMATION',
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'email: XXXXX@gmail.com\n'
                'base: Tokyo\n'
                'skill: Flutter, Java',
                textAlign: TextAlign.left,
                strutStyle:
                    StrutStyle(forceStrutHeight: true, height: 2, leading: 0.9),
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
