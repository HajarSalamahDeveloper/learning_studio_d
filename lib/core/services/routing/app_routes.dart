import 'package:learning_studio/features/auth/presentation/screen/auth_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_studio/core/logging/logger.dart';
import 'package:learning_studio/features/splash/presentation/screen/splash_screen.dart';
 
import 'navigator_service.dart';

part 'router_service.dart';

abstract class AppRoutes {
  static List<RouteBase> routes = [
   
    GoRoute(
      path: AuthScreen.path,
      name: AuthScreen.routeName,
      builder: (context, state) => const AuthScreen(),
    ),
   
    GoRoute(
      path: SplashScreen.path,
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: AddressesScreen.path,
    //   name: AddressesScreen.routeName,
    //   builder: (context, state) => MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => MapCubit(),
    //       ),
    //       BlocProvider(
    //         create: (context) => sl<AddNewAddressCubit>(),
    //       ),
    //     ],
    //     child: AddressesScreen(
    //       addressModel: state.extra as AddressModel?,
    //     ),
    //   ),
    // ),
     
  ];
}
