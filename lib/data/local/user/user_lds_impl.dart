import 'package:project_template/data/local/user/user_lds.dart';

import '../../../configs/constants/hive.dart';
import '../../../domain/models/user.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/hive_helper.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  HiveHelper hiveHelper;
  UserLocalDataSourceImpl(this.hiveHelper);

  @override
  Future cacheUser(UserModel userModel) async {
    try {
      await hiveHelper.add(userModel, key: HiveConstants.user);
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<UserModel> getCachedCustomer() async {
    try {
      bool customerExists = await checkCachedCustomer();
      if (customerExists) {
        UserModel customer = await hiveHelper.getWithKey(HiveConstants.user);
        return customer;
      } else {
        throw AppFailures.defaultFailure;
      }
    } catch (e) {
      throw AppFailures.defaultFailure;
    }
  }

  @override
  Future<bool> checkCachedCustomer() {
    return hiveHelper.checkIfExists(HiveConstants.user);
  }

  @override
  Future deleteCachedCustomer() async {
    return await hiveHelper.delete(HiveConstants.user);
  }
}
