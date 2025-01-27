import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/core/logging/logger.dart';
import 'package:learning_studio/features/auth/presentation/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/shared/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/const/app_images.dart';

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
    Future.delayed(const Duration(milliseconds: 5300), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // context.pushReplacementNamed(!(UserModel.cache()?.isGuest ?? true) ? HomeScreen.routeName : AuthScreen.routeName);
        // context.pushReplacementNamed( AuthScreen.routeName);
        Logger.debug('data');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    //  AppScaffold(
    //     // backgroundColor: AppColors.primaryColor,
        
    //     body:
         Container(
          width: ScreenUtil.defaultSize.width,
          height: ScreenUtil.defaultSize.height,
          
          // width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.background,
            
            ),fit: BoxFit.fill

            ) ,
            color: AppColors.whiteColor ),
            child: Stack(children: [
              AnimatedPositionedDirectional(
                top: 300.h,
                start: 120.w,
                curve: Curves.slowMiddle,
                duration: const Duration(milliseconds: 900),
                child: Image.asset(AppImages.logo,),)
            ])
            // ))
        );
  }
}
