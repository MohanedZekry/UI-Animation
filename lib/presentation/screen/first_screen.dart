import 'package:flutter/material.dart';
import 'package:uianimation/core/animation/slide_transition.dart';
import 'package:uianimation/core/utils/enums_animation.dart';
import 'package:uianimation/presentation/screen/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'GO TO PAGE TWO'
          ),
          onPressed: (){
            Navigator.of(context).push(
              SlideRight(destination: const SecondScreen(),slideAnimationType: SlideAnimationType.slideUp)
            );
          },
        ),
      ),
    );
  }
}
