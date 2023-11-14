import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:xfood/components/navigator.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
      duration: 3000, nextScreen: const NavigatorApp(), 
      splash: Column(
        children: [
          Text("X", style: TextStyle(color: Colors.red[900], fontSize: 50, fontWeight: FontWeight.w700),),
          Text("Seu paladar é nosso compromisso!", style: TextStyle(color: Colors.red[900], fontSize: 15, fontWeight: FontWeight.w700))
        ],
      ), 
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor:const  Color.fromRGBO(35, 35, 35, 1),
    ),);
    }
}