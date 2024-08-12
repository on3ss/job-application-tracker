import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return FHeader(
      title: Text(title),
    );
  }

  IconData getThemeSwitchIcon(AdaptiveThemeMode mode) {
    if (mode == AdaptiveThemeMode.light) {
      return HugeIcons.strokeRoundedMoon02;
    }
    return HugeIcons.strokeRoundedSun01;
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
