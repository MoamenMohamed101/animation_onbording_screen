import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  onScrol() {
    // print('ssss');
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
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
          makePage(),
          makePage(),
          makePage(),
        ],
      ),
    );
  }

  Widget makePage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/one.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: []),
        ),
      ),
    );
  }
}
