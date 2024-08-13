import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
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
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            application.post,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            application.description,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                HugeIcons.strokeRoundedBuilding04,
                size: 16,
              ),
              const SizedBox(width: 4.0),
              Text(application.organisation.name),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                HugeIcons.strokeRoundedLink04,
                size: 16,
              ),
              const SizedBox(width: 4.0),
              Text(application.appliedVia),
            ],
          ),
        ],
      ),
      trailing: const Icon(HugeIcons.strokeRoundedArrowRight01),
      onTap: () {},
    );
  }
}
