import 'package:dartz/dartz.dart';

import '../../../data/local/onboarding/onboarding.dart';
import '../../../helpers/failures.dart';
import 'onboarding.dart';

class OnboardingRepoImpl implements OnboardingRepo {
  OnboardingLocalDataSource onboardingLocalDataSource;
  OnboardingRepoImpl(this.onboardingLocalDataSource);

  @override
  Future<Either<Failure, void>> cacheOnboardinAsDone() async {
    try {
      await onboardingLocalDataSource.cacheOnboardinAsDone();
      return right(null);
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> checkOnboardingDone() async {
    try {
      bool isCached = await onboardingLocalDataSource.checkOnboardingDone();
      return right(isCached);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
