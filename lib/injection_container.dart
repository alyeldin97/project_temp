import 'package:get_it/get_it.dart';
import 'package:project_template/domain/models/user.dart';

import 'application/global/global_cubit.dart';
import 'application/login/sign_in_cubit.dart';
import 'application/onboarding/onboarding_cubit.dart';
import 'application/sign_up/sign_up_cubit.dart';
import 'configs/constants/hive.dart';
import 'data/local/language/language.dart';
import 'data/local/language/language_impl.dart';
import 'data/local/onboarding/onboarding.dart';
import 'data/local/onboarding/onboarding_impl.dart';
import 'data/local/user/user_lds.dart';
import 'data/local/user/user_lds_impl.dart';
import 'data/remote/sign-in/sign_in_rds.dart';
import 'data/remote/sign-in/sign_in_rds_impl.dart';
import 'data/remote/sign_up/sign_up_rds.dart';
import 'domain/repos/onboarding/onboarding.dart';
import 'domain/repos/onboarding/onboarding_impl.dart';
import 'domain/repos/sign_in/sign_in_repo.dart';
import 'domain/repos/sign_in/sign_in_repo_impl.dart';
import 'domain/repos/sign_up/sign_up_repo.dart';
import 'helpers/api_helper.dart';
import 'helpers/hive_helper.dart';

final GetIt sl = GetIt.instance;

Future<void> initGetIt() async {
  //! NetWork Service
  sl.registerFactory<NetworkService>(
    () => NetworkServiceImpl(),
  );

  //! Hive Helpers

  sl.registerSingleton<HiveHelper<String>>(
      HiveHelper<String>(HiveConstants.language),
      instanceName: HiveConstants.language);
  sl.registerSingleton<HiveHelper<String>>(
      HiveHelper<String>(HiveConstants.onboarding),
      instanceName: HiveConstants.onboarding);

  sl.registerSingleton<HiveHelper<UserModel>>(
      HiveHelper<UserModel>(HiveConstants.user),
      instanceName: HiveConstants.user);

  // ! Local data source
  sl.registerFactory<OnboardingLocalDataSource>(() =>
      OnboardingLocalDataSourceImpl(
          sl.get(instanceName: HiveConstants.onboarding)));

  sl.registerFactory<LanguageLocalDataSource>(() => LanguageLocalDataSourceImpl(
      sl.get(instanceName: HiveConstants.language)));

  sl.registerFactory<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sl.get(instanceName: HiveConstants.user)));

  // ! Remote data source
  sl.registerFactory<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(sl()),
  );
  sl.registerFactory<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl()),
  );

  // ! Repos
  sl.registerFactory<OnboardingRepo>(
    () => OnboardingRepoImpl(sl()),
  );

  sl.registerFactory<SignInRepo>(
    () => SignInRepoImpl(sl(), sl()),
  );
  sl.registerFactory<SignUpRepo>(
    () => SignUpRepoImpl(sl(), sl()),
  );
  // ! Cubits
  sl.registerFactory<OnboardingCubit>(() => OnboardingCubit(sl()));
  sl.registerFactory<GlobalCubit>(() => GlobalCubit(sl()));
  sl.registerFactory<SignInCubit>(() => SignInCubit(
        sl(),
      ));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
}
