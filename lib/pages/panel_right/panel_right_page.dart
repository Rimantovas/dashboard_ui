import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/pages/charts.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  final List<String> _genres = ["Metal", "Rap", "Pop"];
  final List<Color> _colors = [
    const Color(0xff4af699),
    const Color(0xffff5182),
    const Color(0xfff8b250)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                  left: Constants.kPadding / 2),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: ListTile(
                    //leading: Icon(Icons.monetization_on),
                    title: Text(
                      "Spotify metrics",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Your top genre listeners",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        "More than a lot",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const LineChartSample1(),
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  bottom: Constants.kPadding,
                  top: Constants.kPadding,
                  left: Constants.kPadding / 2),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: List.generate(
                    _genres.length,
                    (index) => ListTile(
                      title: Text(
                        _genres[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundColor: _colors[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
