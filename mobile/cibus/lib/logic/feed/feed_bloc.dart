import 'package:bloc/bloc.dart';
import 'package:cibus/data/models/donation.dart';
import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/data/repositories/feed_repository.dart';
import 'package:cibus/logic/feed/feed_event.dart';
import 'package:cibus/logic/feed/feed_state.dart';
import 'package:cibus/presentation/feed/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository _feedRepository;

  FeedBloc(FeedRepository feedRepository)
      : _feedRepository = feedRepository,
        super(InitialFeedState());

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is GetDonations) {
      List<Donation> donations = await _feedRepository.getDonations();
      yield ObtainedDonations(donations: donations);
    }
  }

}
