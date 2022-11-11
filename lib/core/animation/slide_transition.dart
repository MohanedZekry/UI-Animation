import 'package:flutter/cupertino.dart';
import '../utils/enums_animation.dart';

class SlideRight extends PageRouteBuilder {

  final Widget destination;
  final SlideAnimationType slideAnimationType;

  SlideRight({required this.destination, required this.slideAnimationType}) : super(
      pageBuilder: (context, animation, animationTwo) => destination,
      transitionsBuilder: (context, animation, animationTwo, child)
      {
        var end = Offset.zero;

        switch(slideAnimationType){
          case SlideAnimationType.slideRight:
            var begin = const Offset(1.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);
          case SlideAnimationType.slideLeft:
            var begin = const Offset(-1.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);
          case SlideAnimationType.slideUp:
            var begin = const Offset(0.0, 1.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);
          case SlideAnimationType.slideDown:
            var begin = const Offset(0.0, -1.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);
        }
      }
  );

}