import 'package:project_template/data/local/language/language.dart';

import '../../../configs/constants/hive.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  LocalStorageService localStorageService;
  LanguageLocalDataSourceImpl(
    this.localStorageService,
  );

  @override
  Future cacheLanguage(String language) async {
    try {
      bool exists =
          await localStorageService.checkIfExists(HiveConstants.language);
      if (exists) {
        await localStorageService.delete(HiveConstants.language,
            key: HiveConstants.language);
      }

      await localStorageService.add(language, key: HiveConstants.language);

      return;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<String> getCachedLanguage() async {
    try {
      String cachedLanguage =
          await localStorageService.getWithKey(HiveConstants.language) ?? '';
      return cachedLanguage;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }
}
