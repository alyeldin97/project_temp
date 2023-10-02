import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_template/helpers/failures.dart';
import '../../domain/repos/onboarding/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingRepo onboardingRepo;

  OnboardingCubit(this.onboardingRepo) : super(OnboardingInitial());
  int currentIndex = 0;
  PageController onboardingPageController = PageController();

  void changeOnBoardingImage(index) {
    switch (index) {
      case 0:
        currentIndex = 0;
        break;
      case 1:
        currentIndex = 1;
        break;
      case 2:
        currentIndex = 2;
        cacheOnboarding();
        break;
    }
    emit(OnboardingChangeImage(currentPage: index));
  }

  void cacheOnboarding() async {
    emit(OnboardingCacheLoading());
    Either<Failure, void> eitherSuccessOrFailure =
        await onboardingRepo.cacheOnboardinAsDone();

    eitherSuccessOrFailure.fold((failure) => emit(OnboardingCacheError()),
        (success) => emit(OnboardingCacheSuccess()));
  }
}
