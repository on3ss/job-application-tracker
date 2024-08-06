import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: Placeholder(),
    );
  }
}
