import 'package:app_skeleton/core/di/locator.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ThemeCubit extends Cubit<ThemeState> {
  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);
  static const _themeKey = 'isDarkMode';

  ThemeCubit() : super(ThemeInitial());

  void loadTheme()   {
    final prefs = sl<SharedPreferencesService>();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    emit(ThemeLoaded(isDarkMode));
  }

  Future<void> toggleTheme()  async {
    if (state is ThemeLoaded) {
      final isDarkMode = !(state as ThemeLoaded).isDarkMode;
      final prefs = sl<SharedPreferencesService>();
        prefs.saveBool(_themeKey, isDarkMode);
       emit(ThemeLoaded(isDarkMode));
     }
  }
}

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDarkMode;
  ThemeLoaded(this.isDarkMode);
}