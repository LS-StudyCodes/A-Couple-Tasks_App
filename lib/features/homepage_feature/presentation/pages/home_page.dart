import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widgets/custom_bottom_nav_bar_widget.dart';
import '../widgets/days_buttons_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Couple Tasks'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double a = constraints.maxHeight * 0.50;
            double userNameHeight = constraints.maxHeight * 0.04;
            double daysListHeight = constraints.maxHeight * 0.15;
            double bottomNavBarHeight = constraints.maxHeight * 0.10;
            return Column(
              children: [
                Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    // Day Buttons - Consider using a ListView for better horizontal scrolling
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        height: daysListHeight,
                          child: DaysButtonsWidget()),
                    ),
                    SizedBox(height: 24),
                    // Placeholder for the list of items
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => _ListItem(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: bottomNavBarHeight,
                    child: CustomBottomNavbar(
                      selectedIndex: _selectedIndex,
                      onItemTapped: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        )
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}