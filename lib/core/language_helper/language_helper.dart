import 'package:shared_preferences/shared_preferences.dart';
class LanguageCacheHelper {
 final SharedPreferences _sharedPreferences;

  LanguageCacheHelper(this._sharedPreferences);
  Future<void> cacheLanguageCode(String languageCode) async {

    _sharedPreferences.setString("LOCALE", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = _sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}