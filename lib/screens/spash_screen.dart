import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/list_characters_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: ListCharacters(),
      duration: 3000,
      imageSize: 250,
      imageSrc: "assets/morty.png",
      text: "Rick and Morty",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30,
        color: Colors.green
      ),
      backgroundColor: Colors.white,
    );
  }
}