import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobApplicationScreen extends StatelessWidget {
  const JobApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Job"),
      body: Placeholder(),
    );
  }
}
