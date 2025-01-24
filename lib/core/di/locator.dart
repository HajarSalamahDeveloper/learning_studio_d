import 'package:app_skeleton/config/localizaion/localization_service.dart';
import 'package:app_skeleton/core/network/dio_client.dart';
import 'package:app_skeleton/core/services/routing/app_routes.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';
import 'package:app_skeleton/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:app_skeleton/features/auth/data/auth_api.dart';
import 'package:app_skeleton/features/auth/data/repo/auth_repo.dart';
import 'package:app_skeleton/features/auth/presentation/cubits/cubit/otp_cubit.dart';
import 'package:app_skeleton/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:app_skeleton/features/auth/presentation/cubits/signup/signin_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> setUpLocator( ) async {
//init services
  sl.registerSingleton<SharedPreferencesService>(SharedPreferencesService(await SharedPreferences.getInstance()));
  // sl.registerSingleton<FirebaseRemoteConfigService>(FirebaseRemoteConfigService(FirebaseRemoteConfig.instance));
  sl.registerSingleton<LocalizationService>(LocalizationService());
  sl.registerSingleton<RouterService>(RouterService());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
//Auth
  sl.registerLazySingleton<AuthApi>(() => AuthApi(sl<DioClient>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl<AuthApi>()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl<AuthRepo>()));
  sl.registerLazySingleton<SignupCubit>(() => SignupCubit(sl<AuthRepo>()));
  sl.registerLazySingleton<OtpCubit>(() => OtpCubit(sl<AuthRepo>()));
}
