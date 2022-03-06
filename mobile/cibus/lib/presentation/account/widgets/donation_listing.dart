import 'package:cibus/data/models/donation.dart';
import 'package:cibus/presentation/detail/donation_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationListing extends StatelessWidget {
  final Donation donation;

  DonationListing({
    Key? key,
    required this.donation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DonationDetail(donation: donation, screen: "AccountPage")));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(6)),
                  child: Image.network(donation.imageUrl,
                      height: 80, width: 100, fit: BoxFit.cover)),
            ),
            Container(
              width: 167,
              height: 80,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(6)),
                color: Color(0xffF0F0F0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  donation.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.8)),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  color: const Color(0xffFAFAFA),
                ),
                child: Center(
                  child: Text(
                    ((donation.weight % 1) == 0
                        ? donation.weight.toInt().toString()
                        : donation.weight.toString()) + "oz",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
