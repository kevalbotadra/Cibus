import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/presentation/auth/auth_page.dart';
import 'package:cibus/presentation/landing/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
          Image.network(
            "https://i.postimg.cc/rp8pprZh/Peach-bro.png", height: 375, width: 375,
          ),
          Text(
            "cibus",
            style: GoogleFonts.nunito(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "food for everyone",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Onboarding1()));
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: const Color(0xff66BA58),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account.",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthPage(
                              authProvider: AuthProvider(
                                  firebaseAuth: FirebaseAuth.instance))));
                },
                child: Text(
                  "Log In.",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
