import 'package:cibus/data/models/donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DonationDetail extends StatelessWidget {
  final Donation donation;
  final String screen;
  const DonationDetail({Key? key, required this.donation, required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onBackButtonPressed() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 11.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35.0,
                      width: 35.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: const Color(0xff007336),
                          child: Icon(Icons.arrow_back),
                          onPressed: _onBackButtonPressed,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      screen == "DonationsPage" ? "Home" : "Account",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff007336)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: const Color(0xff007336),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  donation.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15.0, top: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(donation.imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            DateFormat('MMM dd, yyyy')
                                .format(donation.createdAt.toDate()),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Event Brief: ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: const Color(0xff007336),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        donation.body,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Organization Info: ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color(0xff007336),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 101,
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff007336)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      donation.creator.orgName,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      donation.creator.orgType,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.room),
                                        Text(
                                          donation.address!.street ??
                                              "No Locatin Available",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
