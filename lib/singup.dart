import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home.dart';
import 'location_permission.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).viewPadding.top,
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Entrez votre numéro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: CountryPickerDropdown(
                    initialValue: 'cd',
                    itemBuilder: (Country country) => CountryItem(country),
                    onValuePicked: (Country country) {},
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "9712124972",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  text: "ou connectez-vous\n",
                  children: [
                    TextSpan(text: "les reseaux sociaux"),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blueAccent,
                        ),
                      ),
                    )
                  ],
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Spacer(),
            Text(
                "En continuant, vous pouvez recevoir un SMS de vérification. Des messages et débits de données peuvent être appliqués."),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (!(await Permission.locationWhenInUse.isGranted)) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LocationPermission()));
                  } else {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15))),
                child: Text(
                  "Suivant",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// ### CountryItem
/// CountryItem is the item shows
/// by the contry picker package
class CountryItem extends StatelessWidget {
  final Country country;

  const CountryItem(this.country, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(width: 10),
        Text(
          "+${country.phoneCode}",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
