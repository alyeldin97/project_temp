abstract class LanguageLocalDataSource {
  Future cacheLanguage(String language);
  Future<String> getCachedLanguage();
}