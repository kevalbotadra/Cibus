import 'package:cibus/data/models/donation.dart';
import 'package:cibus/logic/auth/auth_bloc.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/logic/feed/feed_bloc.dart';
import 'package:cibus/logic/feed/feed_state.dart';
import 'package:cibus/presentation/feed/widgets/donation_card.dart';
import 'package:cibus/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ObtainedDonations) {
          return Feed(
            donations: state.donations,
          );
        }
        return LoadingPage();
      },
    );
  }
}

class Feed extends StatefulWidget {
  final List<Donation> donations;
  const Feed({Key? key, required this.donations}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFAFAFA),
          toolbarHeight: 60,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Home",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.black),
            ),
          ),
      ),
      // backgroundColor: Color.fromARGB(255, 139, 205, 141),
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.donations.length,
                  itemBuilder: (context, index) {
                    return DonationCard(
                      donation: widget.donations[index],
                    );
                  }),
                  SizedBox(
                    height: 200,
                  ),
              Container(
                child: Center(
                  child: TextButton(onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                  }, child: Text("Loggout")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
