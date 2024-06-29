import 'package:anim_test/anim_build.dart';
import 'package:anim_test/detail_page.dart';
import 'package:anim_test/home_page.dart';
import 'package:anim_test/new_anim_demo.dart';
import 'package:anim_test/staggered_tween_anim.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NewAnimNewDemo();
                  },
                ));
              },
              icon: Icon(Icons.access_alarm)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AnimBuild();
                  },
                ));
              },
              icon: Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return StaggeredTweenAnim();
                  },
                ));
              },
              icon: Icon(Icons.animation)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ));
              },
              icon: Icon(Icons.home)),
        ],
      ),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailPage(
                    index: index,
                  );
                },
              ));
            },
            child: Column(
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.all(10),
                  child: Hero(
                    tag: "img$index",
                    child: Image.network(playlist[index]),
                  ),
                ),
                Hero(
                  tag: "icon$index",
                  placeholderBuilder: (context, heroSize, child) {
                    return Icon(Icons.air, size: 40);
                  },
                  flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                    return Icon(Icons.flight_takeoff, size: 40);
                  },
                  child: Icon(
                    Icons.flight,
                    size: 40,
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailPage(
                    index: 0,
                  );
                },
              ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "h1",
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

final List<String> playlist = [
  'https://a10.gaanacdn.com/gn_img/albums/w4MKPObojg/MKPDB1YAKo/size_l.jpg',
  'https://a10.gaanacdn.com/gn_img/albums/Rz4W8vKxD5/4W87PAOO3x/size_l.jpg',
  'https://a10.gaanacdn.com/gn_img/albums/4Z9bqo3yQn/9bqZ41LXKy/size_l.jpg',
  'https://a10.gaanacdn.com/gn_img/albums/D0PKLrWGl9/0PKLDnzwKG/size_l_1581694054.webp',
  'https://a10.gaanacdn.com/gn_img/albums/ZaP37RKDy7/P37O6Rql3D/size_l.jpg',
  'https://cdn.prod.website-files.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png',
];
