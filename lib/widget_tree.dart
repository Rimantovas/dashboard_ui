import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dashboard_ui/constants.dart';
import 'package:dashboard_ui/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'pages/drawer/drawer_page.dart';
import 'pages/panel_center/panel_center_page.dart';
import 'pages/panel_left/panel_left_page.dart';
import 'pages/panel_right/panel_right_page.dart';
import 'pages/widgets/app_bar_widget.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  final List<Widget> _icons = const [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : const AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? const PanelLeftPage()
            : currentIndex == 1
                ? const PanelCenterPage()
                : const PanelRightPage(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              color: Constants.buttonLighter,
              backgroundColor: Constants.purpleDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}
