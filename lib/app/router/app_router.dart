import 'package:go_router/go_router.dart';
import 'package:pocky/app/observers/app_route_observer.dart';
import 'package:pocky/common/repositories/counter_repository.dart';
import 'package:pocky/presentation/pachin_navi/pages/pachin_navi_home_page.dart';
import 'package:pocky/presentation/pachinator/pages/pachinator_page.dart';

final class AppRouter {
  AppRouter({
    required CounterRepository counterRepository,
    AppRouteObserver? routeObserver,
  }) : _counterRepository = counterRepository,
       _routeObserver = routeObserver ?? AppRouteObserver();

  final CounterRepository _counterRepository;
  final AppRouteObserver _routeObserver;

  GoRouter router() {
    return GoRouter(
      initialLocation: PachinNaviHomePage.routePath,
      observers: [_routeObserver],
      routes: [
        GoRoute(
          path: PachinNaviHomePage.routePath,
          name: PachinNaviHomePage.routeName,
          builder: (context, state) =>
              PachinNaviHomePage(counterRepository: _counterRepository),
        ),
        GoRoute(
          path: PachinatorPage.routePath,
          name: PachinatorPage.routeName,
          builder: (context, state) => const PachinatorPage(),
        ),
      ],
    );
  }
}
