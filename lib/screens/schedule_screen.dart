import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Schedule"),
      body: Placeholder(),
    );
  }
}
