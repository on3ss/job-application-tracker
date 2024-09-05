import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JobApplicationInfo(),
            _buildStagesHeader(context),
            const Expanded(child: ApplicationStageList()),
          ],
        ),
      ),
    );
  }

  Widget _buildStagesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "STAGES",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(HugeIcons.strokeRoundedFilter),
          ),
        ],
      ),
    );
  }
}

class JobApplicationInfo extends StatelessWidget {
  const JobApplicationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla imperdiet diam purus, pulvinar aliquam dolor malesuada sit amet.',
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
      children: _buildFabChildren(context),
    );
  }

  List<Widget> _buildFabChildren(BuildContext context) {
    return [
      _buildFabButton(
        icon: HugeIcons.strokeRoundedAdd02,
        onPressed: () {},
      ),
      _buildFabButton(
        icon: HugeIcons.strokeRoundedPencilEdit02,
        onPressed: () {},
      ),
      FloatingActionButton.small(
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
        heroTag: null,
        child: const Icon(HugeIcons.strokeRoundedDelete02),
        onPressed: () => _showDeleteDialog(context),
      ),
    ];
  }

  FloatingActionButton _buildFabButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton.small(
      heroTag: null,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Application'),
          content: const Text(
              "Are you sure you want to delete this job application?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
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
    final List<JobApplicationStage> stages =
        useMemoized(() => List.generate(20, (index) => generateStage(1)));

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
    final TextStyle bodyStyle = Theme.of(context).textTheme.bodySmall!;
    final TextStyle titleStyle = Theme.of(context).textTheme.titleMedium!;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color tertiaryColor = Theme.of(context).colorScheme.tertiary;

    return ListTile(
      title: Text(
        stage.name,
        style: titleStyle,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stage.description,
            style: bodyStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          IconWithText(
            icon: HugeIcons.strokeRoundedBooks02,
            text: stage.subjects.join(', '),
          ),
          const SizedBox(height: 4.0),
          IconWithText(
            icon: HugeIcons.strokeRoundedTime04,
            text: DateFormat('hh:mm a').format(stage.on),
          ),
          const SizedBox(height: 4.0),
          IconWithText(
            icon: HugeIcons.strokeRoundedCalendar03,
            text: DateFormat('MMMM d, y').format(stage.on),
          ),
        ],
      ),
      trailing: Icon(
        stage.isDone
            ? HugeIcons.strokeRoundedCheckmarkCircle02
            : HugeIcons.strokeRoundedLoading01,
        color: stage.isDone ? primaryColor : tertiaryColor,
        size: 20.0,
      ),
    );
  }
}
