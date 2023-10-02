import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'configs/bloc_observer.dart';
import 'inits.dart';
import 'injection_container.dart';
import 'my_app.dart';

//! RUN flutter gen-l10n

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initGetIt();
  await Inits.initHive();
  await Inits.getCachedData();
  // tester();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(

      //     DevicePreview(
      //   builder: (context) => MyApp(),
      //   enabled: true,
      // )
      MyApp());

  // DevicePreview(
  // builder: (context) => MyApp(),
  // enabled: true,
  // )
}

// void tester() {
//   jsonToDartConvertor(
//       jsonObject: {
//         "firstName": "Omar",
//         "lastName": "saas",
//         "email": "sameha@gmail.com",
//         "username": "sameha",
//         "password": "/NCHXJRn3E5eWjA./gkvRGmrQbb5x0uqR9WxFbSVwaHEhHa",
//         "phone": "+201007013655",
//         "loginCount": 0,
//         "verified": false,
//         "qualified": false,
//         "_id": "64e1a2e61df3c8fb2c05d53e",
//         "createdAt": "2023-08-20T05:21:42.739Z",
//         "updatedAt": "2023-08-20T05:21:42.739Z",
//         "__v": 0
//       },
//       className: 'User');
// }
