import 'package:cibus/data/models/donation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class InitialMapState extends MapState {}

class InitialMapData extends MapState {
  final List<Donation> donations;
  final Position position;
  InitialMapData({required this.donations, required this.position});
}

class MapFailed extends MapState {
  final String message;
  MapFailed({required this.message});
}
