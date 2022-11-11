import 'package:flutter/cupertino.dart';
import '../utils/enums_animation.dart';

class RouteTransition extends PageRouteBuilder {

  final Widget destination;
  final AnimationType slideAnimationType;

  RouteTransition({required this.destination, required this.slideAnimationType}) : super(
      pageBuilder: (context, animation, animationTwo) => destination,
      transitionsBuilder: (context, animation, animationTwo, child)
      {
        var end = Offset.zero;
        switch(slideAnimationType){
          case AnimationType.slideRight:
            var begin = const Offset(1.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            /// Using Curved Animation ///
            var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
            return SlideTransition(position: tween.animate(curvedAnimation), child: child,);

          case AnimationType.slideLeft:
            var begin = const Offset(-1.0, 0.0);
            var tween = Tween(begin: begin, end: end);
            /// Using simple offset transition ///
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);

          case AnimationType.slideUp:
            var begin = const Offset(0.0, 1.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);

          case AnimationType.slideDown:
            var begin = const Offset(0.0, -1.0);
            var tween = Tween(begin: begin, end: end);
            var offsetTransition = animation.drive(tween);
            return SlideTransition(position: offsetTransition, child: child,);

          case AnimationType.scaleUp:
            var begin = 0.0;
            var endScale = 1.0;
            var tween = Tween(begin: begin, end: endScale);
            var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
            return ScaleTransition(scale: tween.animate(curvedAnimation), child: child,);

          case AnimationType.rotate:
            var begin = 0.0;
            var endScale = 1.0;
            var tween = Tween(begin: begin, end: endScale);
            var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
            return RotationTransition(turns: tween.animate(curvedAnimation), child: child,);

          case AnimationType.sizeUp:
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(sizeFactor: animation,child: child),
            );

          case AnimationType.opacity:
            return Align(
              alignment: Alignment.center,
              child: FadeTransition(opacity: animation,child: child),
            );


        }
      }
  );

}