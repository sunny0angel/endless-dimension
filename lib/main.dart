import 'package:bonfire/bonfire.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:endless_dimension/menu.dart';
import 'package:endless_dimension/util/localization/my_localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util/localization/my_localizations_delegate.dart';

MyLocalizationsDelegate myLocation;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Comment when running for web
  if (!kIsWeb) {
    await Flame.util.setLandscape();
    await Flame.util.fullScreen();
  }
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
      home: FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        onFinish: (BuildContext context) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
          );
        },
      ),
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

// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               'Bonfire',
//               style: TextStyle(fontSize: 30, color: Colors.white),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 child: Text('START'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => GameManualMap()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 40,
//         child: Center(
//           child: Text(
//             'Keyboard: directional and Space Bar to attack',
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }
