import 'package:project_template/data/local/language/language.dart';

import '../../../configs/constants/hive.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  HiveHelper hiveHelper;
  LanguageLocalDataSourceImpl(
    this.hiveHelper,
  );

  @override
  Future cacheLanguage(String language) async {
    try {
      bool exists = await hiveHelper.checkIfExists(HiveConstants.language);
      if (exists) {
        await hiveHelper.delete(HiveConstants.language,
            key: HiveConstants.language);
      }

      await hiveHelper.add(language, key: HiveConstants.language);

      return;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<String> getCachedLanguage() async {
    try {
      String cachedLanguage =
          await hiveHelper.getWithKey(HiveConstants.language) ?? '';
      return cachedLanguage;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }
}
