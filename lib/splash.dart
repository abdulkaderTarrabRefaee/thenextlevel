import 'dart:async';

import 'package:flutter/material.dart';

import 'lang_screen.dart';
import 'main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    Timer(
        const Duration(seconds: 4),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const LangView())));
    var assetsImage = const AssetImage(
        'images/logo.png'); //<- Creates an object that fetches an image.
    var image = Image.network("https://nextlevelkw.com/wp-content/uploads/2022/01/logo-01-01.png",scale: 0.3,); //<- Creates a widget that displays an image.
    return  Scaffold(

      body: Container(
        width: double.infinity,
        height:double.infinity ,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [  Color(0xFF00a99d), Color(0xFF29abe2)],transform: GradientRotation(35.0))
        ),
        child: Center(
          child: image,
        ),
      ),
    );
  }
}