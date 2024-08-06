import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = useMemoized(() => generateApplications(20));
    return Scaffold(
      appBar: const CustomAppBar(title: "Jobs"),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          JobApplication job = jobs[index];
          return ListTile(
            title: Text(job.post),
          );
        },
      ),
    );
  }
}
