import 'dart:math';

import 'package:flutter/material.dart';

class AnimBuild extends StatefulWidget {
  const AnimBuild({super.key});

  @override
  State<AnimBuild> createState() => _AnimBuildState();
}

class _AnimBuildState extends State<AnimBuild> with TickerProviderStateMixin {
  double size = 0;

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 360).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 360),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.rotate(
                  angle: pi * value / 180,
                  child: Text(
                    "Hello All",
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            // TweenAnimationBuilder(
            //   tween: ColorTween(begin: Colors.red, end: Colors.transparent),
            //   duration: Duration(seconds: 3),
            //   builder: (context, value, child) {
            //     return TweenAnimationBuilder(
            //       tween: Tween<double>(begin: 300, end: 0),
            //       duration: Duration(seconds: 2),
            //       builder: (context, value2, child) {
            //         return Transform.scale(
            //           scale: value2,
            //           child: Icon(
            //             Icons.ac_unit,
            //             color: value,
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Text(
                  "Hey",
                  style: TextStyle(fontSize: animation.value * 0.5),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "11",
            onPressed: () {
              controller.forward();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}
