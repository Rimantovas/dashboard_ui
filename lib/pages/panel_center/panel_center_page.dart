import 'dart:ui';
import 'package:dashboard_ui/pages/charts.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatelessWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Person> _persons = [
      Person(name: "AC/DC", color: const Color(0xfff8b250)),
      Person(name: "Metallica", color: const Color(0xfff8b250)),
      Person(name: "Bella Poarch", color: const Color(0xff0293ee)),
      Person(name: "Daddy was a milkman", color: const Color(0xffff5182)),
      Person(name: "Queen", color: const Color(0xff13d38e)),
      Person(name: "The Rolling Stones", color: const Color(0xff0293ee)),
      Person(name: "Van Halen", color: const Color(0xfff8b250)),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
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
                  //leading: Icon(Icons.sell),
                  title: Text(
                    "Your favourite artists",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "You know you love em",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      "💓",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: List.generate(
                  _persons.length,
                  (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      child: Text(
                        _persons[index].name.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: _persons[index].color,
                    ),
                    title: Text(
                      _persons[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
