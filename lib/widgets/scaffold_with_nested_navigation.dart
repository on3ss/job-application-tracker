import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

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
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 1,
          enableFeedback: true,
          type: BottomNavigationBarType.shifting,
          currentIndex: navigationShell.currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          unselectedItemColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                context,
                HugeIcons.strokeRoundedDashboardSpeed01,
                navigationShell.currentIndex == 0,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context,
                HugeIcons.strokeRoundedCalendar03,
                navigationShell.currentIndex == 1,
              ),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context,
                HugeIcons.strokeRoundedNewJob,
                navigationShell.currentIndex == 2,
              ),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                context,
                HugeIcons.strokeRoundedSettings02,
                navigationShell.currentIndex == 3,
              ),
              label: 'Settings',
            ),
          ],
          onTap: _goBranch,
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData iconData, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Icon(iconData),
    );
  }
}
