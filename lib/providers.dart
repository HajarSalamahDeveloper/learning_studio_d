import 'package:learning_studio/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_studio/core/di/locator.dart';
import 'package:learning_studio/features/auth/presentation/cubits/login/login_cubit.dart';

/*
Adding all providers in this file is so wrong but it works.
*/
class Providers extends StatelessWidget {
  const Providers({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ThemeCubit>()..loadTheme(),
      ),
    ], child: child);
  }
}
