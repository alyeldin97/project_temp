import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/local/language/language.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  LanguageLocalDataSource languageLocalDataSource;

  GlobalCubit(this.languageLocalDataSource) : super(GlobalInitial());
  String curLanguage = 'en';
  String accessToken = '';
  String refreshToken = '';
  bool isEnglish = true;

  void changeLanguage(String curLanguage) async {
    this.curLanguage = curLanguage;
    isEnglish = curLanguage == 'en';
    await languageLocalDataSource.cacheLanguage(curLanguage);

    if (curLanguage == 'en') {
      emit(GlobalLanguageChangedEN());
    } else {
      emit(GlobalLanguageChangedAR());
    }
  }

  Future<String> getCachedLanguage() async {
    curLanguage = await languageLocalDataSource.getCachedLanguage();
    isEnglish = curLanguage == 'en';
    return curLanguage;
  }
}
