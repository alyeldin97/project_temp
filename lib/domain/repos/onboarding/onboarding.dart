import 'package:dartz/dartz.dart';

import '../../../helpers/failures.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, void>> cacheOnboardinAsDone();
  Future<Either<Failure, bool>> checkOnboardingDone();
}
