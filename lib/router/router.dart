import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_tracker/screens/home_screen.dart';
import 'package:job_tracker/screens/jobs_screen.dart';
import 'package:job_tracker/screens/schedule_screen.dart';
import 'package:job_tracker/screens/settings.dart';

part "router.g.dart";

// TODO: Use StatefullShellRouter.indexedStack

@TypedGoRoute<HomeScreenRoute>(path: '/')
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<ScheduleScreenRoute>(path: '/schedule')
@immutable
class ScheduleScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScheduleScreen();
  }
}

@TypedGoRoute<JobsScreenRoute>(path: '/jobs')
@immutable
class JobsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobsScreen();
  }
}

@TypedGoRoute<SettingsScreenRoute>(path: '/settings')
@immutable
class SettingsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
