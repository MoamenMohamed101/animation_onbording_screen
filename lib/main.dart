import 'package:animation_onbording_screen/FadeAnimation.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int totalPage = 4;

  onScrol() {
    // print('ssss');
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        onScrol();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          makePage(
              'assets/images/one.jpg',
              'Yosemite National Park',
              'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
              '1'),
          makePage(
              'assets/images/two.jpg',
              'Golden Gate Bridge',
              'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
              '2'),
          makePage(
              'assets/images/three.jpg',
              'Sedona',
              'Sedona is regularly described as one of America\'s most beautiful places. Nowhere else will you find a landscape as dramatically colorful.',
              '3'),
          makePage(
              'assets/images/four.jpg',
              'Savannah',
              'Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.',
              '4'),
        ],
      ),
    );
  }

  Widget makePage(String image, String title, String description, String page) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [.3, .9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(2, Text(
                    page.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeAnimation(2, Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(1.5, Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(Icons.star,
                              color: Colors.grey, size: 15),
                        ),
                        const Text(
                          '4.0',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        const Text('(2300)',
                            style:
                            TextStyle(color: Colors.white38, fontSize: 12))
                      ],
                    ),),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2.5, Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2, Text(
                      'Read More',
                      style: TextStyle(color: Colors.white),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
