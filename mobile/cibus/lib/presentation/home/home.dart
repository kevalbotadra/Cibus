import 'package:cibus/presentation/account/widgets/account_redirect.dart';
import 'package:cibus/presentation/create/create_donation.dart';
import 'package:cibus/presentation/feed/widgets/feed_redirect.dart';
import 'package:cibus/presentation/map/widgets/map_redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 10);

  int _currentIndex = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.green;
  Color unselectedColor = Colors.black;

  PageController _pageController = new PageController(initialPage: 0);

  List<Widget> pages = [
    FeedRedirect(),
    MapRedirect(),
    CreatePageRedirect(),
    AccountRedirect(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: _currentIndex == 0 ? false : true,
      body: pages[_currentIndex],
      // PageView(
      //   controller: _pageController,
      //   onPageChanged: (newIndex) {
      //     setState(() {
      //       _currentIndex = newIndex;
      //     });
      //   },
      //   children: [
      //     Feed(),
      //     Map(),
      //     Container(
      //       color: Colors.purple,
      //     ),
      //   ],
      // ),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Colors.white, // Color.fromARGB(255, 139, 205, 141),
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _currentIndex,
        onTap: (index) {
          // _pageController.animateToPage(index,
          //     duration: Duration(milliseconds: 500), curve: Curves.ease);
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'feed'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
