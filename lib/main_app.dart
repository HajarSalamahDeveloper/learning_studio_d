import 'package:app_skeleton/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_skeleton/config/localizaion/localization_service.dart';
import 'package:app_skeleton/config/themes/themes.dart';
import 'package:app_skeleton/core/di/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/core/logging/logger.dart';
import 'package:app_skeleton/core/services/routing/app_routes.dart';
import 'package:app_skeleton/core/services/routing/navigator_service.dart';
import 'package:app_skeleton/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:app_skeleton/features/auth/presentation/screen/auth_screen.dart';
import 'package:app_skeleton/providers.dart';
import 'package:app_skeleton/shared/widgets/modals/app_toast.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationService = sl<LocalizationService>();

    return EasyLocalization(
      supportedLocales: localizationService.supportedLocales,
      path: localizationService.translationPath,
      startLocale: localizationService.currentLocale,
      fallbackLocale: localizationService.fallbackLocale,
      child: Providers(
        child: ScreenUtilInit(
          designSize:
              const Size(403, 895), // Design size based on your design tool
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is Logout) {
                  Logger('context.goNamed $state');
                  NavigationService.goTo(AuthScreen.routeName).then((_) {
                    AppToast.showInfoSnackBar(message: 'انتهت الجلسة');
                  });
                }
              },
              builder: (context, state) {
                return BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    final isDarkMode =
                        state is ThemeLoaded ? state.isDarkMode : false;
                        Logger('isDarkMode $isDarkMode');
                     return MaterialApp.router(
                       debugShowCheckedModeBanner: false,
                      debugShowMaterialGrid: false,
                      routerConfig: sl<RouterService>().router,
                      // home: const TestScreen(),
                      supportedLocales: context.supportedLocales,
                      localizationsDelegates: context.localizationDelegates,
                      locale: context.locale,
                      theme: AppTheme.lightTheme,
                      darkTheme: AppTheme.darkTheme,
                      
                      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                      // themeMode: ThemeMode.light, 
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
