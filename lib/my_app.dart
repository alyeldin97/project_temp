import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/routes.dart';

import 'application/global/global_cubit.dart';
import 'application/login/sign_in_cubit.dart';
import 'application/onboarding/onboarding_cubit.dart';
import 'application/sign_up/sign_up_cubit.dart';
import 'configs/constants/sizes.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize:
          const Size(AppSizes.mobileDesignWidth, AppSizes.mobileDesignHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<GlobalCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<SignInCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<SignUpCubit>(),
          ),
        ],
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: AppColors.mainColorMaterial,
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      // statusBarBrightness: Brightness.dark,
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  )),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate, // Add this line

                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              locale: Locale.fromSubtags(
                  languageCode:
                      BlocProvider.of<GlobalCubit>(context).curLanguage),
              onGenerateRoute: (routeSettings) =>
                  RouteGenerator.getRoute(routeSettings),
            );
          },
        ),
      ),
    );
  }
}
