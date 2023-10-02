
import '../../../domain/models/user.dart';

abstract class UserLocalDataSource {
  Future cacheUser(UserModel customerModel);
  Future<bool> checkCachedCustomer();
  Future<UserModel> getCachedCustomer();
  Future deleteCachedCustomer();
}
