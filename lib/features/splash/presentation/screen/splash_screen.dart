import 'package:app_skeleton/core/logging/logger.dart';
import 'package:app_skeleton/features/auth/presentation/screen/auth_screen.dart';
import 'package:app_skeleton/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:app_skeleton/config/const/app_images.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/shared/widgets/app_scaffold.dart';
import 'package:app_skeleton/shared/widgets/images/asset_image.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen';
  static const String path = '/splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // GetSlidersCubit.get(context).getSliders();
    // ProductsCubit.get(context).getProducts();
    // FeedCubit.get(context).getFeedData();

    _initialRoute();
  }

  _initialRoute() {
    Future.delayed(const Duration(milliseconds: 4500), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // context.pushReplacementNamed(!(UserModel.cache()?.isGuest ?? true) ? HomeScreen.routeName : AuthScreen.routeName);
        context.pushReplacementNamed( AuthScreen.routeName);
        Logger.debug('data');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        backgroundColor: AppColors.primaryColor,
        body:  SizedBox.shrink());
  }
}
