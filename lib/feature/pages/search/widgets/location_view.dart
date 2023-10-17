import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_trade_new/feature/pages/search/search_page.dart';
import '../../../../common/models/location_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import '../../../../common/styles/app_colors.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? _controller;
  final _textEditingController = TextEditingController();

  double lat = 41.311081;
  double lon = 69.240562;

  Future<void> searchCity(String city) async {
    try {
      final url = Uri.parse('https://geocode.maps.co/search?q="${city.trim()}');
      final response = await http.get(url);
      List<Location> location = jsonDecode(response.body)
          .map((json) => Location.fromJson(json))
          .cast<Location>()
          .toList();
      setState(() {
        lat = double.tryParse(location[0].lat) ?? 40.7770883;
        lon = double.tryParse(location[0].lon) ?? 68.3329752;
        controller.city = location[0].displayName;
      });
    } catch (e) {
      lat = 41.311081;
      lon = 69.240562;
      city = "Toshkent O'zbekistan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: (controller) {
            setState(() => _controller = controller);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lon),
            zoom: 12,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("Target"),
              position: LatLng(lat, lon),
              icon: BitmapDescriptor.defaultMarker,
            )
          },
        ),
        Positioned(
          top: 25,
          left: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.white,
            child: IconButton(
              onPressed: () => Navigator.pop<Object?>(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              width: 380,
              height: 65,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 55,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: SearchBar(
                  hintText: "Find location",
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.search),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors.white),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  controller: _textEditingController,
                  onSubmitted: (String value) {
                    searchCity(value);
                    _controller?.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(lat, lon),
                          zoom: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 670,
          left: 25,
          child: SizedBox(
            height: 150,
            width: 360,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Location detail",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.softGrey2,
                            child: Icon(Icons.location_on_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 260,
                              child: Text(
                                controller.city,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  height: 1.3,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 830,
          left: 60,
          child: Container(
            width: 278,
            height: 63,
            decoration: ShapeDecoration(
              color: AppColors.limeGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "Choose Line",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 250,
          right: 16,
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  _textEditingController.clear();
                  setState(() {});
                  lat = 41.311081;
                  lon = 69.240562;
                  _controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(lat, lon),
                        zoom: 12,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.my_location),
                backgroundColor: Colors.yellow,
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  _controller?.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  _controller?.animateCamera(CameraUpdate.zoomOut());
                },
                child: const Icon(Icons.remove),
                backgroundColor: Colors.red,
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  setState(() {});
                  _controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(lat, lon),
                        zoom: 12,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.search),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
