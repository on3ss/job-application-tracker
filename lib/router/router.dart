import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_tracker/screens/home_screen.dart';
import 'package:job_tracker/screens/job_applications/add_job_application_screen.dart';
import 'package:job_tracker/screens/job_applications/add_stage.dart';
import 'package:job_tracker/screens/job_applications/job_application_screen.dart';
import 'package:job_tracker/screens/job_applications/job_applications_screen.dart';
import 'package:job_tracker/screens/schedule_screen.dart';
import 'package:job_tracker/screens/settings.dart';
import 'package:job_tracker/widgets/scaffold_with_nested_navigation.dart';

part "router.g.dart";

@TypedStatefulShellRoute<AppShellRouteData>(branches: [
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<HomeScreenRoute>(path: '/'),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<ScheduleScreenRoute>(path: '/schedule'),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<JobsScreenRoute>(path: '/jobs', routes: [
        TypedGoRoute<JobScreenRoute>(path: 'job', name: 'job'),
        TypedGoRoute<JobCreateRoute>(path: 'create', name: 'job-create'),
        TypedGoRoute<StageCreateRoute>(
          path: 'stage-create',
          name: 'stage-create',
        ),
      ]),
    ],
  ),
  TypedStatefulShellBranch(
    routes: [
      TypedGoRoute<SettingsScreenRoute>(path: '/settings'),
    ],
  ),
])
class AppShellRouteData extends StatefulShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
  }
}

@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@immutable
class ScheduleScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScheduleScreen();
  }
}

@immutable
class JobsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobApplicationsScreen();
  }
}

@immutable
class JobScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobApplicationScreen();
  }
}

@immutable
class JobCreateRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddJobApplicationScreen();
  }
}

@immutable
class StageCreateRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddApplicationStage();
  }
}

@immutable
class SettingsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
