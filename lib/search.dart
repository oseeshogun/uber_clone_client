import 'package:flutter/material.dart';
import 'package:uber_client_clone/direction.dart';
import 'package:uuid/uuid.dart';

class SearchPlace extends StatefulWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/thumb/women/5.jpg"),
            ),
            const SizedBox(width: 10),
            Text("Pour moi",
                style: TextStyle(
                  color: Colors.black,
                )),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                CustomPaint(
                  painter: PainterGraph(),
                  child: Container(
                    height: 70,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  focusColor: Colors.grey[200],
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  hintText: "Position actuelle",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  focusColor: Colors.grey[200],
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  hintText: "Où allez ?",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  // final sessionToken = Uuid().v4();
                                  // final result = PlaceApiProvider(sessionToken)
                                  //     .fetchSuggestions(value, "fr");
                                  // debugPrint(result.toString());
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DirectionBetweenPoints()));
                      },
                      elevation: 0,
                      child: Icon(Icons.gps_fixed),
                      backgroundColor: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Position actuelle",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(60.0, 0.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DirectionBetweenPoints()));
                  },
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DirectionBetweenPoints()));
                        },
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
                Transform.translate(
                  offset: Offset(60.0, 0.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DirectionBetweenPoints()));
                  },
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DirectionBetweenPoints()));
                        },
                        elevation: 0,
                        child: Icon(Icons.work),
                        backgroundColor: Colors.red,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Travaille",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(60.0, 0.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PainterGraph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Offset topCenter = Offset(0, 0);
    final Offset bottomCenter = Offset(0, size.height);
    canvas.drawCircle(topCenter, 4, Paint()..color = Colors.grey);
    canvas.drawLine(topCenter, bottomCenter, Paint()..color = Colors.grey);
    canvas.drawRect(
      Rect.fromCenter(
        center: bottomCenter,
        width: 10,
        height: 10,
      ),
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
