import 'package:cibus/data/providers/map_provider.dart';
import 'package:cibus/data/repositories/map_repository.dart';
import 'package:cibus/logic/map/map_bloc.dart';
import 'package:cibus/logic/map/map_event.dart';
import 'package:cibus/presentation/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapRepository = new MapRepository(mapProvider: new MapProvider());

    return Container(
      alignment: Alignment.center,
    child: BlocProvider<MapBloc>(
        create: (context) => MapBloc(mapRepository)..add(StartMap()),
        child: MapPage(),
      ),
    );
  }
}