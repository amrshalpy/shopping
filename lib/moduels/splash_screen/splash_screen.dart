import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:matgar/moduels/login/login.dart';

class SplashScreen extends StatelessWidget {
  Widget? route;
  SplashScreen({Key? key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoSize: 160,
      logo: Image.asset('assets/images/undraw_Movie_night_re_9umk.png'),
      title: Text(
        "Matgar",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: route,
      durationInSeconds: 5,
    );
  }
}
