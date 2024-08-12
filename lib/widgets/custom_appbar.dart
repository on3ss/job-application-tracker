import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:job_tracker/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return FHeader(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: CustomIcon(asset: FAssets.icons.sun),
        )
      ],
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
