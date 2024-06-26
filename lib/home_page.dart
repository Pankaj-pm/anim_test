import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation sizeAnim = Tween(begin: 0.0, end: 35.0).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(0, 0.1),
  ));
  late Animation colorAnim = ColorTween(begin: Colors.black12, end: Colors.red).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(0.1, 0.3),
  ));

  late Animation opacityAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(0, 0.1),
  ));

  late Animation translateAnim = Tween(begin: 1000.0, end: 0.0).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(0.3, 0.6),
  ));

  late Animation translateAnim1 = Tween(begin: 1000.0, end: 0.0).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(0.6, 1, curve: Curves.bounceOut),
  ));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget? child) => ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => LinearGradient(colors: [
                              colorAnim.value,
                              Colors.black12,
                            ]).createShader(
                              Rect.fromLTWH(0, 5, bounds.width, bounds.height),
                            ),
                            child: Opacity(
                              opacity: opacityAnim.value,
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "To Red and White",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CircleAvatar(
                          radius: sizeAnim.value,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?size=338&ext=jpg"),
                        );
                      })
                ],
              ),
              Divider(
                thickness: 2,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) => Transform.translate(
                  offset: Offset(0, translateAnim.value),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) => Transform.translate(
                  offset: Offset(0, translateAnim1.value),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Title"),
                        subtitle: Text("aba@gmail.com"),
                      );
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
      ),
    );
  }
}
