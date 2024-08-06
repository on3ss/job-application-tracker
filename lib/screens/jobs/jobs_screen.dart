import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Jobs"),
      body: Placeholder(),
    );
  }
}
