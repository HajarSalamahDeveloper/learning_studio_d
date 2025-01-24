import 'package:app_skeleton/core/di/locator.dart';
import 'package:app_skeleton/core/logging/logger.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
 abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDarkMode;
  ThemeLoaded(this.isDarkMode);
}


class ThemeCubit extends Cubit<ThemeState> {
  static const _themeKey = 'isDarkMode';

  ThemeCubit() : super(ThemeInitial());

  void loadTheme() async {
    final prefs = sl<SharedPreferencesService>();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    emit(ThemeLoaded(isDarkMode));
  }

  void toggleTheme() async {
    if (state is ThemeLoaded) {
      final isDarkMode = !(state as ThemeLoaded).isDarkMode;
    final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, isDarkMode);
 
      emit(ThemeLoaded(isDarkMode));
    }
   }
}

