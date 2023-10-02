import '../../../configs/constants/hive.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';
import 'onboarding.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  HiveHelper hiveHelper;
  OnboardingLocalDataSourceImpl(this.hiveHelper);
  @override
  Future cacheOnboardinAsDone() async {
    try {
      hiveHelper.add(true, key: HiveConstants.onboarding);
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<bool> checkOnboardingDone() async {
    try {
      bool isCached =
          await hiveHelper.getWithKey(HiveConstants.onboarding) ?? false;
      return isCached;
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }
}
