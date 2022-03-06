import 'package:cibus/data/models/donation.dart';
import 'package:cibus/logic/map/map_bloc.dart';
import 'package:cibus/logic/map/map_state.dart';
import 'package:cibus/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state);
        if (state is InitialMapData) {
          return DonationsMap(
            donations: state.donations,
            userLocation: state.position,
          );
        }
        return LoadingPage();
      },
    );
  }
}

class DonationsMap extends StatefulWidget {
  final List<Donation> donations;
  final Position userLocation;

  const DonationsMap(
      {Key? key, required this.donations, required this.userLocation})
      : super(key: key);

  @override
  _DonationsMapState createState() => _DonationsMapState();
}

class _DonationsMapState extends State<DonationsMap> {
  TextEditingController searchController = TextEditingController();
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    print(widget.donations);
    for (Donation donation in widget.donations) {
      setState(() {
        String markerIdVal = donation.uniqueId;
        MarkerId markerId = MarkerId(markerIdVal);

        // creating a new MARKER
        Marker marker = Marker(
          markerId: markerId,
          position: LatLng(
            donation.lat,
            donation.long,
          ),
          infoWindow: InfoWindow(
              title: donation.title, snippet: donation.creator.orgName),
          onTap: () {},
        );
        markers.add(marker);
      });
    }
    print(markers.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                widget.userLocation.latitude, widget.userLocation.longitude),
            zoom: 10.0,
          ),
          zoomGesturesEnabled: true,
          markers: markers,
        ),
        Positioned(
          top: 55,
          left: 30,
          child: Container(
            height: 46,
            width: 330,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.search),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search for donations..",
                      border: InputBorder.none,
                    ),
                    controller: searchController,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
