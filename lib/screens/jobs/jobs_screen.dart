import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/dev_only/models.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = useMemoized(() => generateApplications(20));
    final isLoading = useState(false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Jobs"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add job application action
        },
        child: const Icon(HugeIcons.strokeRoundedPlusSign),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15,
              ),
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final application = applications[index];
                return JobApplicationListItem(
                  key: ValueKey(application.id),
                  application: application,
                );
              },
              separatorBuilder: (context, index) => const Divider(),
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
      title: Text(
        application.post,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: _buildSubtitle(context),
      onTap: () => context.goNamed('job'),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4.0),
        Text(
          application.description,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                "${application.isDoneStages} Done",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            const VerticalDivider(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 4.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                "${application.isNotDoneStages} Left",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        IconWithText(
          icon: HugeIcons.strokeRoundedBuilding04,
          text: application.organisation.name,
        ),
        const SizedBox(height: 4.0),
        IconWithText(
          icon: HugeIcons.strokeRoundedLink04,
          text: application.appliedVia,
        ),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
        const VerticalDivider(width: 8),
        Text(text),
      ],
    );
  }
}
