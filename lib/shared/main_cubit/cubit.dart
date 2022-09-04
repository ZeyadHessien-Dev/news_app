import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/main_cubit/states.dart';
import 'package:news_application/shared/network/local/cache_helper.dart';
import 'package:news_application/shared/style/theme.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialMainState());

  static MainCubit get(context) => BlocProvider.of(context);

  ThemeData themeData = lightTheme;
  bool themeIs = true;

  void changeTheme({bool? isShow}) {
    if (isShow != null) {
      themeData = isShow ? darkTheme : lightTheme;
      emit(ChangeThemeMainState());
    }
    else if(isShow == null) {
      themeData = themeIs ? darkTheme : lightTheme;
      CacheHelper.setData(key: 'isDark', value: themeIs);
      themeIs = !themeIs;
      emit(ChangeThemeMainState());
    }
  }
}
