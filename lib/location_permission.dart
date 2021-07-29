import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home.dart';

class LocationPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                  "assets/svgs/undraw_My_location_re_r52x.svg"),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "Wate a besion d'accéder à la géolocalisation pour bien fonctionner.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Text(
            "En activant la géolocalisation, vous serez capable de voir vos itinéraires, votre position et les positions des taxis.",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: ElevatedButton(
              onPressed: () async {
                if (await Permission.locationWhenInUse.request().isGranted) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15))),
              child: Text(
                "Activer",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
