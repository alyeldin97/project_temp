import '../../../configs/constants/hive.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';
import 'onboarding.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  LocalStorageService localStorageService;
  OnboardingLocalDataSourceImpl(this.localStorageService);
  @override
  Future cacheOnboardinAsDone() async {
    try {
      localStorageService.add(true, key: HiveConstants.onboarding);
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<bool> checkOnboardingDone() async {
    try {
      bool isCached =
          await localStorageService.get(HiveConstants.onboarding,key:HiveConstants.onboarding) ?? false;
      return isCached;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }
}
