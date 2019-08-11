import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity').add(
        Duration(
          milliseconds: 500,
        ),
        Tween(
          begin: 0.0,
          end: 1.0,
        ),
      ),
      Track('translateX').add(
        Duration(
          milliseconds: 500,
        ),
        Tween(
          begin: 130.0,
          end: 0.0,
        ),
        curve: Curves.easeOut,
      )
    ]);

    return ControlledAnimation(
      delay: Duration(
        milliseconds: (300 * delay).round(),
      ),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'] as double,
        child: Transform.translate(
          offset: Offset(
            animation['translateX'] as double,
            0,
          ),
          child: child,
        ),
      ),
    );
  }
}
