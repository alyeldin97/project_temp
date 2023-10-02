part of 'onboarding_cubit.dart';

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingChangeImage extends OnboardingState {
  int currentPage;
  OnboardingChangeImage({
    required this.currentPage,
  });
}

class OnboardingCacheLoading extends OnboardingState {}

class OnboardingCacheSuccess extends OnboardingState {}

class OnboardingCacheError extends OnboardingState {}
