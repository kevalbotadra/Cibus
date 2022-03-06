import 'package:cibus/data/models/donation.dart';
import 'package:cibus/presentation/detail/donation_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// class DonationCard extends StatelessWidget {
//   final Donation donation;
//   const DonationCard({Key? key, required this.donation}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   DonationDetail(donation: donation, screen: "DonationsPage"),
//             ),
//           );
//         },
//         child: Stack(
//           children: [
//             Container(
//               height: 300,
//             ),
//             Positioned(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//                 child: Image.network(donation.imageUrl),
//               ),
//             ),
//             Positioned(
//               top: 200,
//               left: 20,
//               child: Container(
//                 padding: EdgeInsets.only(left: 15, top: 5),
//                 height: 100,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black,
//                       blurRadius: 2.0,
//                       spreadRadius: 0.0,
//                       offset:
//                           Offset(2.0, 2.0), // shadow direction: bottom right
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       donation.title,
//                       style: GoogleFonts.poppins(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(Icons.storefront),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Text(donation.creator.orgName)
//                       ],
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(Icons.room),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Text(donation.address!.street ??
//                             "No Location Available"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DonationCard extends StatelessWidget {
  final Donation donation;
  const DonationCard({Key? key, required this.donation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DonationDetail(
                      donation: donation, screen: "DonationsPage")));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(donation.creator.pfpUrl),
                            backgroundColor: const Color(0xff66BA58),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(donation.creator.name,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.black,
                                    )),
                                Text(donation.creator.orgName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_horiz_outlined,
                        color: const Color(0xff66BA58),
                      ),
                    ]),
              ),
              SizedBox(
                height: 6,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    donation.imageUrl,
                  )),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(donation.title + " - "  + donation.weight.toString() + " oz",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black,
                            )),
                        Text(
                          DateFormat('MMM dd, yyyy h:mm a')
                              .format(donation.createdAt.toDate()),
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_forward,
                            color: Colors.green, size: 25),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: const Color(0xff66BA58),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
