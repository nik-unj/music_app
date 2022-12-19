import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music/screen/homePage.dart';
import 'package:music/style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/image/bg.png',
              ),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.low),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New podcasts every day",
                style: whiteHeading(45),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We analyze your tastes and offer you only what you like",
                style: whiteNormalText(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
