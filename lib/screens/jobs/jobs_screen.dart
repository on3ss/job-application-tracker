import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = useMemoized(() => generateApplications(20));
    return Scaffold(
      appBar: const CustomAppBar(title: "Jobs"),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          JobApplication application = applications[index];
          return JobApplicationListItem(application: application);
        },
      ),
    );
  }
}

class JobApplicationListItem extends StatelessWidget {
  final JobApplication application;

  const JobApplicationListItem({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: ListTile(
        title: Text(application.post),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Organisation: ${application.organisation.name}'),
            Text('Applied via: ${application.appliedVia}'),
            // Text('Date: ${application.applicationDate.toLocal().toString().split(' ')[0]}'),
            if (application.link != null)
              Text('Link: ${application.link}',
                  style: const TextStyle(color: Colors.blue)),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
