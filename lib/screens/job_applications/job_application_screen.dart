import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/screens/job_applications/widgets/icon_with_text.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobApplicationScreen extends HookWidget {
  const JobApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: const CustomAppBar(title: "Job Post Name"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla imperdiet diam purus, pulvinar aliquam dolor malesuada sit amet.'),
                  SizedBox(height: 8.0),
                  IconWithText(
                    icon: HugeIcons.strokeRoundedBuilding04,
                    text: "Meghalaya Public Service Commission",
                  ),
                  SizedBox(height: 4.0),
                  IconWithText(
                    icon: HugeIcons.strokeRoundedCalendarAdd01,
                    text: "28 December 2024",
                  ),
                ],
              ),
            ),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(child: Text("All")),
                Tab(child: Text("Pending")),
                Tab(child: Text("Done")),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  ApplicationStageList(),
                  ApplicationStageList(),
                  ApplicationStageList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationStageList extends HookWidget {
  const ApplicationStageList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobApplicationStage> stages =
        useMemoized(() => List.generate(10, (index) => generateStage(1)));
    return ListView.separated(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text(
          stages[index].name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stages[index].description,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              children: stages[index]
                  .subjects
                  .map(
                    (subject) => Badge(
                      label: Text(subject),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: stages.length,
    );
  }
}
