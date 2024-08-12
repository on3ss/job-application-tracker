import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FScaffold(
      contentPad: false,
      header: CustomAppBar(title: "Home"),
      content: Placeholder(),
    );
  }
}
