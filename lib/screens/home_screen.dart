import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Home"),
      body: Placeholder(),
    );
  }
}
