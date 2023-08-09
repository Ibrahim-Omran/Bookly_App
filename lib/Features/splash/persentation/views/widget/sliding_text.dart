
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    // استخدمنا الAnimatedBuilder عشان منعملش بيناء للاسكرين من الاول
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _ ) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              // هايجي في السنتر عشان هو واخد العرض بتاع الشاشة
              textAlign: TextAlign.center,
            ),
          );
        }
    );
  }
}
