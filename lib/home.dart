import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uber_client_clone/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Location location = new Location();
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    Future<CameraPosition> getCurrentPosition() async {
      final locationData = await location.getLocation();
      return CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15.4746,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FutureBuilder<CameraPosition>(
                      future: getCurrentPosition(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GoogleMap(
                            mapType: MapType.normal,
                            zoomControlsEnabled: false,
                            initialCameraPosition: snapshot.data!,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          );
                        }
                        return Container(
                          color: Colors.lightGreen[200],
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.translate(
                        offset: Offset(
                            -10.0, -MediaQuery.of(context).size.height * .05),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            if (_controller.isCompleted) {
                              _controller.future.then((value) async {
                                final locationData =
                                    await location.getLocation();
                                final myPosition = CameraPosition(
                                  target: LatLng(locationData.latitude!,
                                      locationData.longitude!),
                                  zoom: 15.4746,
                                );
                                final CameraUpdate cameraUpdate =
                                    CameraUpdate.newCameraPosition(myPosition);
                                value.animateCamera(cameraUpdate);
                              });
                            }
                          },
                          child: Icon(Icons.gps_fixed, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(70),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Prêt? Alors roulons",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Vous décidez où. Vous décidez quand.\nNous gérons le reste.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  text: "",
                                  children: [
                                    TextSpan(text: "Rouler avec Wate"),
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              "assets/images/car-top-view_500x500.png",
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchPlace()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Où allez ?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.query_builder),
                                  const SizedBox(width: 10),
                                  Text("Maintenant"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            elevation: 0,
                            child: Icon(Icons.home),
                            backgroundColor: Colors.red,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Maison",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
