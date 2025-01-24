part of 'app_routes.dart';

class RouterService {
  final GoRouter router;
  RouterService()
      : router = GoRouter(
          navigatorKey: NavigationService.navigatorKey, // Key for GoRouter
          initialLocation: AuthScreen.path,
          redirect: (context, state) {
            Logger.route(state.uri.toString());
            return null;
          },
          routes: AppRoutes.routes,
          errorBuilder: (context, state) => const Text('Error! Route not found.'),
        );
}
