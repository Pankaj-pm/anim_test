import 'package:flutter/material.dart';

class NewAnimNewDemo extends StatefulWidget {
  const NewAnimNewDemo({super.key});

  @override
  State<NewAnimNewDemo> createState() => _NewAnimNewDemoState();
}

class _NewAnimNewDemoState extends State<NewAnimNewDemo> with TickerProviderStateMixin {
  late AnimationController _controller;

  // late Animation<double> translateAnim = Tween(begin: 0.0, end: -300.0).animate(
  //   CurvedAnimation(parent: _controller, curve: Interval(0, 0.15)),
  // );
  late Animation<double> translateAnim;

  // late Animation<double> sizeAnim = Tween(begin: 50.0, end: 300.0).animate(
  //   CurvedAnimation(parent: _controller, curve: Interval(0.15, 1)),
  // );

  late Animation<double> sizeAnim;

  late Animation<Color?> colorAnim = ColorTween(begin: Colors.yellow, end: Colors.grey).animate(
    CurvedAnimation(parent: _controller, curve: Interval(0.7, 1)),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));

    translateAnim = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -300.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -300.0, end: 0.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -150.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -150.0, end: 0.0), weight: 1),
      ],
    ).animate(_controller);

    sizeAnim = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 300.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 300.0, end: 50.0), weight: 1),
      ],
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(0, translateAnim.value),
                child: InkWell(
                  onTap: () {
                    _controller.reset();
                    _controller.forward();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorAnim.value,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: sizeAnim.value,
                    width: sizeAnim.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
