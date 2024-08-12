import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CustomIcon extends StatelessWidget {
  final SvgAsset asset;
  final double? width;
  final double? height;
  final ColorFilter? colorFilter;
  const CustomIcon(
      {super.key,
      required this.asset,
      this.width,
      this.height,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return asset(
      width: width,
      height: height,
      colorFilter: colorFilter ??
          ColorFilter.mode(
            theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
    );
  }
}
