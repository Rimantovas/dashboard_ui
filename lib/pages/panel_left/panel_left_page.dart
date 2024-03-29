import 'package:dashboard_ui/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../charts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todos = [
    Todo(name: "Listen to some songs", enable: true),
    Todo(name: "Find the lyrics", enable: true),
    Todo(name: "Sign the song in the shower", enable: true),
    Todo(name: "Find the rating of the song", enable: true),
    Todo(name: "Spam the song so it goes up in rating", enable: false),
    Todo(name: "Repeat", enable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      right: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        //leading: Icon(Icons.shopping_basket),
                        title: Text(
                          "Songs listened to: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "In months",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "A lot",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const LineChartSample2(),
                //const PieChartSample2(),
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
                        _todos.length,
                        (index) => CheckboxListTile(
                          title: Text(
                            _todos[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _todos[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _todos[index].enable = newValue ?? true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
