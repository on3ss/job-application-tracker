import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const JobApplicationFab(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JobApplicationInfo(),
            ApplicationStageListTabs(tabController: tabController),
            ApplicationStageListViews(tabController: tabController),
          ],
        ),
      ),
    );
  }
}

class ApplicationStageListViews extends StatelessWidget {
  const ApplicationStageListViews({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [
          ApplicationStageList(),
          ApplicationStageList(),
          ApplicationStageList(),
        ],
      ),
    );
  }
}

class JobApplicationInfo extends StatelessWidget {
  const JobApplicationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ApplicationStageListTabs extends StatelessWidget {
  const ApplicationStageListTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: [
        const Tab(child: Text("All")),
        Tab(
          child: Row(
            children: [
              Icon(
                HugeIcons.strokeRoundedLoading01,
                color: Theme.of(context).colorScheme.tertiary,
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
              const Text("Pending"),
            ],
          ),
        ),
        Tab(
          child: Row(
            children: [
              Icon(
                HugeIcons.strokeRoundedCheckmarkCircle02,
                color: Theme.of(context).colorScheme.primary,
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
              const Text("Done"),
            ],
          ),
        ),
      ],
    );
  }
}

class JobApplicationFab extends StatelessWidget {
  const JobApplicationFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      overlayStyle: const ExpandableFabOverlayStyle(blur: 2),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(HugeIcons.strokeRoundedRocket01),
        fabSize: ExpandableFabSize.regular,
      ),
      children: [
        FloatingActionButton.small(
          heroTag: null,
          child: const Icon(HugeIcons.strokeRoundedAdd02),
          onPressed: () {},
        ),
        FloatingActionButton.small(
          heroTag: null,
          child: const Icon(HugeIcons.strokeRoundedPencilEdit02),
          onPressed: () {},
        ),
        FloatingActionButton.small(
          backgroundColor: Theme.of(context).colorScheme.error,
          foregroundColor: Theme.of(context).colorScheme.onError,
          heroTag: null,
          child: const Icon(HugeIcons.strokeRoundedDelete02),
          onPressed: () {},
        ),
      ],
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
        bottom: MediaQuery.of(context).size.height * 0.15,
      ),
      itemBuilder: (context, index) =>
          ApplicationStageListItem(stage: stages[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: stages.length,
    );
  }
}

class ApplicationStageListItem extends StatelessWidget {
  const ApplicationStageListItem({
    super.key,
    required this.stage,
  });

  final JobApplicationStage stage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        stage.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stage.description,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          Wrap(
            direction: Axis.horizontal,
            spacing: 8.0,
            children: stage.subjects
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
          ),
        ],
      ),
      trailing: Icon(
        stage.isDone
            ? HugeIcons.strokeRoundedCheckmarkCircle02
            : HugeIcons.strokeRoundedLoading01,
        color: stage.isDone
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        size: 20.0,
      ),
    );
  }
}
