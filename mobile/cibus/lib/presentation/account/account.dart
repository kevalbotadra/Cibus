import 'package:cibus/data/models/user.dart';
import 'package:cibus/logic/account/account_bloc.dart';
import 'package:cibus/logic/account/account_event.dart';
import 'package:cibus/logic/account/account_state.dart';
import 'package:cibus/presentation/account/widgets/donation_listing.dart';
import 'package:cibus/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountObtained) {
          return Account(
            user: state.user,
          );
        }

        return LoadingPage();
      },
    );
  }
}

class Account extends StatefulWidget {
  final CibusUser user;
  const Account({Key? key, required this.user}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      "https://i.postimg.cc/3w9SBT4h/dune-green.png",
                      height: 225,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.grey[50],
                  ),
                ],
              ),
              Positioned(
                  top: 100,
                  left: 130,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      height: 30,
                      width: 125,
                      child: Center(
                        child: Text(
                          widget.user.orgName,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                        ),
                      ))),
              Positioned(
                top: 155,
                left: 140,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage(widget.user.pfpUrl),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.user.orgType == "Donor" ? widget.user.name + "'s Pantry" : "Recieved",
                  style: GoogleFonts.poppins(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.user.posts.length,
            itemBuilder: (context, index) {
              return DonationListing(donation: widget.user.posts[index]);
            },
          ),
        ],
      ),
    );
  }
}
