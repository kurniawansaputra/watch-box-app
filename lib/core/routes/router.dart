import 'package:go_router/go_router.dart';

import '../../presentation/choose_accounts/pages/choose_account_page.dart';
import '../../presentation/detail_movie/pages/detail_movie_page.dart';
import '../../presentation/home/pages/account_page.dart';
import '../../presentation/home/pages/dashboard_page.dart';
import '../../presentation/home/pages/downloads_page.dart';
import '../../presentation/home/pages/home_page.dart';
import '../../presentation/home/pages/search_page.dart';

part 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: '/choose-account',
  routes: [
    GoRoute(
      path: '/choose-account',
      name: Routes.chooseAccounts,
      builder: (context, state) => const ChooseAccountPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        final bool hideNavBar = _shouldHideNavBar(state.fullPath);
        final int selectedIndex = _getSelectedIndex(state.uri.toString());

        return HomePage(
          selectedIndex: selectedIndex,
          showBottomNav: !hideNavBar,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          name: Routes.dashboard,
          builder: (context, state) => const DashboardPage(),
          routes: [
            GoRoute(
              path: 'movie/:id',
              builder: (context, state) {
                final movieId = state.pathParameters['id']!;
                return DetailMoviePage(movieId: movieId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          name: Routes.search,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/downloads',
          name: Routes.downloads,
          builder: (context, state) => const DownloadsPage(),
        ),
        GoRoute(
          path: '/account',
          name: Routes.account,
          builder: (context, state) => const AccountPage(),
        ),
      ],
    ),
  ],
);

int _getSelectedIndex(String location) {
  if (location.startsWith('/dashboard')) return 0;
  if (location.startsWith('/search')) return 1;
  if (location.startsWith('/downloads')) return 2;
  if (location.startsWith('/account')) return 3;
  return 0;
}

bool _shouldHideNavBar(String? fullPath) {
  return fullPath?.contains('/movie/') ?? false;
}
