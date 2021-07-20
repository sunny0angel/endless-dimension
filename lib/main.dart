import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:endless_dimension/menu.dart';
import 'package:endless_dimension/util/localization/my_localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util/localization/my_localizations_delegate.dart';

MyLocalizationsDelegate myLocation = MyLocalizationsDelegate();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  myLocation = const MyLocalizationsDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.vt323().fontFamily,
      ),
      home: Menu(),
      supportedLocales: MyLocalizationsDelegate.supportedLocales(),
      localizationsDelegates: [
        myLocation,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: myLocation.resolution,
    );
  }
}
