import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      contentPad: false,
      content: navigationShell,
      footer: FBottomNavigationBar(
        index: navigationShell.currentIndex,
        onChange: (index) => _goBranch(index),
        items: [
          FBottomNavigationBarItem(
            icon: FAssets.icons.circleGauge,
            label: 'Dashboard',
          ),
          FBottomNavigationBarItem(
            icon: FAssets.icons.calendarRange,
            label: 'Schedule',
          ),
          FBottomNavigationBarItem(
            icon: FAssets.icons.briefcaseBusiness,
            label: 'Applications',
          ),
          FBottomNavigationBarItem(
            icon: FAssets.icons.bolt,
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
