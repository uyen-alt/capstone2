import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_marker/marker_icon.dart';

class TabLocationScreen extends StatefulWidget {
  const TabLocationScreen({Key? key}) : super(key: key);

  @override
  TabLocationScreenState createState() => TabLocationScreenState();
}

class TabLocationScreenState extends State<TabLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 20);

  Set<Marker> markers = {};
  late Future<Position> position;
  MapType mapType = MapType.normal;

  @override
  void initState() {
    position =
        Geolocator.getCurrentPosition().then((value) => addToMarker(value));
    super.initState();
  }

  Future<Position> addToMarker(Position p) async {
    Future<Position> tmp = Geolocator.getCurrentPosition();

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(p.latitude, p.longitude), zoom: 14)));
    markers.clear();
    BitmapDescriptor bitmapDescriptor =
        await MarkerIcon.downloadResizePictureCircle(
            "https://scontent.fdad3-6.fna.fbcdn.net/v/t1.15752-9/335568198_1175531306490850_7489441739909757807_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=ae9488&_nc_ohc=0D4l3kw2hXYAX_9boJZ&_nc_ht=scontent.fdad3-6.fna&oh=03_AdTq6zDCfDUrW26dSn4VbCE5E8taj749XSMxamtFUjT1aQ&oe=64396E23");
    markers.add(Marker(
        icon: bitmapDescriptor,
        markerId: const MarkerId('currentLocation'),
        position: LatLng(p.latitude, p.longitude)));
    setState(() {});
    return tmp;
  }

  void changeMapType() {
    setState(() {
      mapType = mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          zoomControlsEnabled: false,
          mapType: mapType,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 24, left: 5),
          child: InkWell(
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(212, 210, 229, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.notifications_rounded,
                color: Color.fromRGBO(106, 0, 191, 1),
              ),
            ),
            onTap: () {},
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 65, left: 5),
          child: InkWell(
            child: Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(212, 210, 229, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.sos,
                  color: Colors.red,
                )),
            onTap: () {},
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(top: 24, left: 5),
          child: InkWell(
            onTap: changeMapType,
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(212, 210, 229, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.map,
                color: Color.fromRGBO(106, 0, 191, 1),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
