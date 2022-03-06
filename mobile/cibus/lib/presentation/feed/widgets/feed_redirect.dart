
import 'package:cibus/data/providers/feed_provider.dart';
import 'package:cibus/data/repositories/feed_repository.dart';
import 'package:cibus/logic/feed/feed_bloc.dart';
import 'package:cibus/logic/feed/feed_event.dart';
import 'package:cibus/presentation/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedRepostory = new FeedRepository(feedProvider: new FeedProvider());

    return Container(
      alignment: Alignment.center,
    child: BlocProvider<FeedBloc>(
        create: (context) => FeedBloc(feedRepostory)..add(GetDonations()),
        child: FeedPage(),
      ),
    );
  }
}