import 'package:cibus/data/models/donation.dart';
import 'package:equatable/equatable.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class InitialFeedState extends FeedState {}

class ObtainedDonations extends FeedState {
  final List<Donation> donations;
  ObtainedDonations({required this.donations});
}

class FeedFailed extends FeedState {
  final String message;
  FeedFailed({required this.message});
}
