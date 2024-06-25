import 'dart:math';

import 'dart:math';

import 'package:anim_test/main.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
        actions: [
          TextButton(
              onPressed: () {
                controller.animateTo(
                  0,
                  duration: Duration(seconds: 3),
                  curve: Curves.easeOutBack,
                );
              },
              child: Text("Home")),
          TextButton(
              onPressed: () {
                controller.animateTo(
                  500,
                  duration: Duration(seconds: 3),
                  curve: Curves.linear,
                );
              },
              child: Text("About")),
          TextButton(
              onPressed: () {
                controller.animateTo(
                  1000,
                  duration: Duration(seconds: 3),
                  curve: Curves.easeOutBack,
                );
              },
              child: Text("Contact")),
          Hero(
            tag: "icon${widget.index}",
            child: Icon(
              Icons.flight_takeoff,
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.black12,
              margin: EdgeInsets.all(5),
              child: Text("Home", style: TextStyle(fontSize: 50)),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.black12,
              margin: EdgeInsets.all(5),
              child: Text("About", style: TextStyle(fontSize: 50)),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.black12,
              margin: EdgeInsets.all(5),
              child: Text("Contact", style: TextStyle(fontSize: 50)),
            ),
            InkWell(
              onTap: () {
                setState(() {});
              },
              onHover: (value) {
                print("object");
                if (value) {
                  setState(() {});
                }
              },
              child: AnimatedContainer(
                width: Random().nextInt(200) + 20.toDouble(),
                height: Random().nextInt(200) + 20.toDouble(),
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                    border: Border.all(
                      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                      width: Random().nextInt(5).toDouble(),
                    ),
                    borderRadius: BorderRadius.circular(Random().nextInt(50).toDouble())),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {});
              },
              onHover: (value) {
                print("object");
                if (value) {
                  setState(() {});
                }
              },
              child: AnimatedContainer(
                width: Random().nextInt(200) + 20.toDouble(),
                height: Random().nextInt(200) + 20.toDouble(),
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                    border: Border.all(
                      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                      width: Random().nextInt(5).toDouble(),
                    ),
                    borderRadius: BorderRadius.circular(Random().nextInt(50).toDouble())),
              ),
            ),
            ListView.builder(
              itemCount: 60,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                  child: Text("index $index"),
                );
              },
            ),
            AnimatedContainer(
              width: 300,
              height: 300,
              margin: EdgeInsets.all(10),
              duration: const Duration(milliseconds: 500),
              child: Hero(
                tag: "img${widget.index}",
                child: Image.network(
                  playlist[widget.index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FloatingActionButton(
                heroTag: "h1",
                onPressed: () {
                  setState(() {});
                },
                child: Icon(Icons.add)),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.remove)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.jumpTo(controller.position.maxScrollExtent);
          controller.animateTo(
            controller.position.maxScrollExtent,
            duration: Duration(seconds: 3),
            curve: Curves.easeOutBack,
          );
        },
        child: Icon(Icons.download),
      ),
    );
  }
}

