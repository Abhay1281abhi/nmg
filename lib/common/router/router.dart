import 'package:auto_route/auto_route.dart';
import '../../ui/dashboard/dashboard_screen.dart';
import '../../ui/splash/splash_screen.dart';

@MaterialAutoRouter(
    routes: (<AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: DashboardScreen),

  ]))

class $AppRouter {}
