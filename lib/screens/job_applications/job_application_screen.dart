import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/screens/job_applications/widgets/icon_with_text.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobApplicationScreen extends HookWidget {
  const JobApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Job Post Name"),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const JobApplicationFab(),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const JobApplicationInfo(),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stages",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(HugeIcons.strokeRoundedFilter),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const ApplicationStageList(),
        ),
      ),
    );
  }
}

class JobApplicationInfo extends StatelessWidget {
  const JobApplicationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Nulla imperdiet diam purus, pulvinar aliquam dolor '
            'malesuada sit amet.',
          ),
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

class JobApplicationFab extends StatelessWidget {
  const JobApplicationFab({super.key});

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
          onPressed: () => _navigateToAddStage(context),
        ),
        FloatingActionButton.small(
          heroTag: null,
          child: const Icon(HugeIcons.strokeRoundedPencilEdit02),
          onPressed: () => _navigateToEditApplication(context),
        ),
        FloatingActionButton.small(
          backgroundColor: Theme.of(context).colorScheme.error,
          foregroundColor: Theme.of(context).colorScheme.onError,
          heroTag: null,
          child: const Icon(HugeIcons.strokeRoundedDelete02),
          onPressed: () => _showDeleteDialog(context),
        ),
      ],
    );
  }

  void _navigateToAddStage(BuildContext context) {
    // Navigate to the Add Stage screen
    GoRouter.of(context).push('/add-stage');
  }

  void _navigateToEditApplication(BuildContext context) {
    // Navigate to the Edit Application screen
    GoRouter.of(context).push('/edit-application');
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Application'),
          content: const SingleChildScrollView(
            child: Text(
              "Are you sure you want to delete this job application?",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                context.pop();
                GoRouter.of(context).go("/jobs");
              },
            ),
          ],
        );
      },
    );
  }
}

class ApplicationStageList extends HookWidget {
  const ApplicationStageList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobApplicationStage> stages = useMemoized(
      () => List.generate(20, (index) => generateStage(index + 1)),
    );
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
  const ApplicationStageListItem({super.key, required this.stage});

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
