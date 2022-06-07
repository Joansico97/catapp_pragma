import 'package:go_router/go_router.dart';
import 'package:catapp_pragma/routes/routes_handler.dart';

class RouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/homeBuilder',
    routes: <GoRoute>[
      GoRoute(
        path: '/homeBuilder',
        builder: homeBuilder,
      ),
      GoRoute(
        path: '/itemBuilder',
        builder: itemBuilder,
      ),
    ],
    errorBuilder: notFoundPage,
    urlPathStrategy: UrlPathStrategy.path,
  );
}
