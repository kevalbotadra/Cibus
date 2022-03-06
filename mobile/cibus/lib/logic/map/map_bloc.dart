import 'package:bloc/bloc.dart';
import 'package:cibus/data/models/donation.dart';

import 'package:cibus/data/repositories/map_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cibus/logic/map/map_event.dart';
import 'package:cibus/logic/map/map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;

  MapBloc(MapRepository mapRepository)
      : _mapRepository = mapRepository,
        super(InitialMapState());

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is StartMap) {
      List<Donation> donations = await _mapRepository.getDonations();
      Position position = await _mapRepository.getUserLocation();
      yield InitialMapData(
        donations: donations,
        position: position,
      );
    }
  }
}
