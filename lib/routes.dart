import 'package:csi_app/pages/mobile/others/events/allEvents.dart';
import 'package:csi_app/pages/mobile/tabs/dashboard.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final GoRouter routes = GoRouter(initialLocation: '/dashboard', routes: [
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/Allevents',
      builder: (context, state) => const Allevents(),
    )
  ]);
}
