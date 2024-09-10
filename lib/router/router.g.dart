// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomeScreenRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/schedule',
              factory: $ScheduleScreenRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/jobs',
              factory: $JobsScreenRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'job',
                  name: 'job',
                  factory: $JobScreenRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'create',
                  name: 'job-create',
                  factory: $JobCreateRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'stage-create',
                  name: 'stage-create',
                  factory: $StageCreateRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      AppShellRouteData();
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ScheduleScreenRouteExtension on ScheduleScreenRoute {
  static ScheduleScreenRoute _fromState(GoRouterState state) =>
      ScheduleScreenRoute();

  String get location => GoRouteData.$location(
        '/schedule',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JobsScreenRouteExtension on JobsScreenRoute {
  static JobsScreenRoute _fromState(GoRouterState state) => JobsScreenRoute();

  String get location => GoRouteData.$location(
        '/jobs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JobScreenRouteExtension on JobScreenRoute {
  static JobScreenRoute _fromState(GoRouterState state) => JobScreenRoute();

  String get location => GoRouteData.$location(
        '/jobs/job',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JobCreateRouteExtension on JobCreateRoute {
  static JobCreateRoute _fromState(GoRouterState state) => JobCreateRoute();

  String get location => GoRouteData.$location(
        '/jobs/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StageCreateRouteExtension on StageCreateRoute {
  static StageCreateRoute _fromState(GoRouterState state) => StageCreateRoute();

  String get location => GoRouteData.$location(
        '/jobs/stage-create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsScreenRouteExtension on SettingsScreenRoute {
  static SettingsScreenRoute _fromState(GoRouterState state) =>
      SettingsScreenRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
