import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';
import 'package:job_tracker/widgets/custom_icon.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomIcon(
                  asset: FAssets.icons.landmark,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(width: 8.0),
                Text(application.organisation.name),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIcon(
                  asset: FAssets.icons.link2,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(width: 8.0),
                Text(application.appliedVia),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
