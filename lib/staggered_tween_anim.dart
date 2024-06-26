import 'package:flutter/material.dart';

class StaggeredTweenAnim extends StatefulWidget {
  const StaggeredTweenAnim({super.key});

  @override
  State<StaggeredTweenAnim> createState() => _StaggeredTweenAnimState();
}

class _StaggeredTweenAnimState extends State<StaggeredTweenAnim> with TickerProviderStateMixin {
  late AnimationController _controller  = AnimationController(duration: Duration(seconds: 3), vsync: this);

  late AnimationController _controller1 = AnimationController(duration: Duration(seconds: 3), vsync: this);

  late Animation posAnim =
      Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  late Animation<Color?> colorAnim = ColorTween(begin: Colors.red, end: Colors.yellow).animate(_controller);
  late Animation<double> heightAnim = Tween(begin: 50.0, end: 30.0).animate(CurvedAnimation(
    parent: _controller,
    // curve: Curves.bounceIn,
    curve: Interval(0.9, 1, curve: Curves.bounceIn),
  ));

  // late Animation<double> sizeAnim = Tween(begin: 50.0, end: 200.0).animate(CurvedAnimation(parent: _controller1, curve: Curves.bounceIn));
  late Animation sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller.forward();


    sizeAnim= TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 50.0,end: 200.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 200.0,end: 100.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 100.0,end: 150.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 150.0,end: 50.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 50.0,end: 200.0), weight: 1),

    ]).animate(_controller1);
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
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                    alignment: Alignment(0, posAnim.value),
                    child: Container(
                      height: heightAnim.value,
                      width: 50,
                      decoration: BoxDecoration(
                        color: colorAnim.value,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ));
              }),
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Container(
                width: sizeAnim.value,
                height: sizeAnim.value,
                color: Colors.grey,
              );
            },
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              _controller1.forward();
              // _controller.forward();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _controller1.reverse();
            },
          ),
        ],
      ),
    );
  }
}
