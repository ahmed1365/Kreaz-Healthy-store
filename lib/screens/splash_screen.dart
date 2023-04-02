import 'package:flutter/material.dart';
import 'package:kreaz/screens/main_categories_Screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MainSplashScreen extends StatefulWidget {
  static const routeName = 'Splash';

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          SplashScreen(
            backgroundColor: Colors.teal,
            seconds: 1,
            navigateAfterSeconds: main_caregories_Screen(),
            title: Text(
              "كـــريـــــز ",
              maxLines: 2,
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: "ArefRuqaa-Regular",
                  fontWeight: FontWeight.w900),
            ),
            loaderColor: Colors.yellowAccent,
          ),
        ]),
      ),
    );
  }
}
