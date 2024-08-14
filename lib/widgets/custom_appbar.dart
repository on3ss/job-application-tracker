import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 1,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      actions: [
        ValueListenableBuilder<AdaptiveThemeMode>(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (_, mode, __) => IconButton(
            onPressed: () =>
                AdaptiveTheme.of(context).toggleThemeMode(useSystem: false),
            icon: Icon(getThemeSwitchIcon(mode)),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
      bottom: bottom,
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
