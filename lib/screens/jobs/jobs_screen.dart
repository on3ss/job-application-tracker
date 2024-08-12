import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = useMemoized(() => generateApplications(20));
    return FScaffold(
      contentPad: false,
      header: const CustomAppBar(title: "Jobs"),
      content: ListView.builder(
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
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: FCard(
        title: Text(application.post),
        subtitle: Text(
          application.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Organisation: ${application.organisation.name}'),
            Text('Applied via: ${application.appliedVia}'),
            if (application.link != null)
              Text(
                'Link: ${application.link}',
                style: const TextStyle(color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
