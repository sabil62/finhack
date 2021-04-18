import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finhack/pages/budget_page.dart';
import 'package:finhack/pages/create_budget.dart';
import 'package:finhack/pages/daily_page.dart';
import 'package:finhack/pages/profile.dart';
import 'package:finhack/pages/stats_page.dart';
import 'package:finhack/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexstack = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            indexstack = 4;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: getAnimatedNavigation(),
    );
  }

  Widget getAnimatedNavigation() {
    List<IconData> iconList = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person
    ];
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: indexstack,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 16,
      rightCornerRadius: 16,
      splashColor: secondary,
      activeColor: primary,
      inactiveColor: Colors.black.withOpacity(0.5),
      onTap: (index) {
        setState(() {
          indexstack = index;
        });
        ;
      },
    );
  }

  Widget indexWidget() {
    return IndexedStack(
      index: indexstack,
      children: [
        DailyPage(),
        StatsApp(),
        BudgetPage(),
        Profile(),
        CreateBudget(),
      ],
    );
  }
}
