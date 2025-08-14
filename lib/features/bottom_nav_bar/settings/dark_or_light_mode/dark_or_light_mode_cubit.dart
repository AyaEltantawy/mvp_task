import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../main.dart';
import 'dark_or_light_mode_state.dart';

class DarkOrLightModeCubit extends Cubit<DarkOrLightModeState> {
  DarkOrLightModeCubit() : super(DarkOrLightModeStateInit());
  bool isDarkMode = CacheHelper.getData(key: 'isDark') ?? false;
  static DarkOrLightModeCubit get(context) => BlocProvider.of(context);
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    CacheHelper.saveData(key: 'isDark', value: isDarkMode);

    emit(ThemeState(isDarkMode));
  }
}
