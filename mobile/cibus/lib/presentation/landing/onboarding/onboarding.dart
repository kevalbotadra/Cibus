import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/presentation/auth/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  int _currentIndex = 0;

  double _width1 = 23;
  double _height1 = 6;
  Color color1 = const Color(0xff66BA58);

  double _width2 = 6;
  double _height2 = 6;
  Color color2 = Colors.grey;

  double _width3 = 6;
  double _height3 = 6;
  Color color3 = Colors.grey;

  void incrementAndAnimate() {
    if (_currentIndex == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AuthPage(
                  authProvider:
                      AuthProvider(firebaseAuth: FirebaseAuth.instance))));
      return;
    }

    setState(() {
      _currentIndex++;
    });

    if (_currentIndex == 1) {
      setState(() {
        _width1 = 6;
        _height1 = 6;
        color1 = Colors.grey;

        _width2 = 23;
        _height2 = 6;

        color2 = const Color(0xff66BA58);

        _width3 = 6;
        _height3 = 6;
      });
    } else if (_currentIndex == 2) {
      setState(() {
        _width1 = 6;
        _height1 = 6;

        _width2 = 6;
        _height2 = 6;
        color2 = Colors.grey;

        _width3 = 23;
        _height3 = 6;
        color3 = const Color(0xff66BA58);
      });
    }
  }

  List<String> images = [
    "https://i.postimg.cc/VL3Zq9jN/amico.png",
    "https://i.postimg.cc/MpSJY8SN/amico.png",
    "https://i.postimg.cc/5tmPWZDH/amico.png"
  ];

  List<String> text = [
    "Easily locate donations around you using our top of the art donation posting system.",
    "Donors will be able to easily post any surplus food that they have that can be distributed to local food shelters and banks.",
    "Easy transportation access through our partnership with non-profit delivery systems, Invisible Hands and Delivering Good.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 20,
            color: const Color(0xff66BA58),
          ),
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/cibus-428b7/o/Group%209.png?alt=media&token=a69c13ce-61d2-417a-bb43-99b62d4da32d",
            scale: 0.5,
          ),
          SizedBox(
            height: 55,
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 5),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.network(
              images[_currentIndex],
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: _height1,
                width: _width1,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: color1),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                height: _height2,
                width: _width2,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: color2),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                height: _height3,
                width: _width3,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: color3),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 5),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                text[_currentIndex],
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            enableFeedback: false,
            onPressed: () {
              incrementAndAnimate();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _currentIndex == 0 || _currentIndex == 1
                      ? "Continue"
                      : "Okay!",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: const Color(0xff66BA58),
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
