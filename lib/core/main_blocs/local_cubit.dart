import 'package:bloc/bloc.dart';




import 'package:flutter/material.dart';
import 'package:microtectask/core/language_helper/language_helper.dart';
import 'package:microtectask/core/main_blocs/local_state.dart';


import 'package:shared_preferences/shared_preferences.dart';



class LocaleCubit extends Cubit<ChangeLocaleState> {
  final SharedPreferences _sharedPreferences;
  LocaleCubit(this._sharedPreferences) : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
    await LanguageCacheHelper(_sharedPreferences).getCachedLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper(_sharedPreferences).cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
