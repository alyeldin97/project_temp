import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:project_template/data/local/user/user_lds.dart';
import 'package:project_template/domain/repos/sign_in/sign_in_repo.dart';
import 'package:project_template/helpers/app_global_data.dart';

import '../../../data/entities/user.dart';
import '../../../data/remote/sign-in/sign_in_rds.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/network_error_helper.dart';
import '../../models/user.dart';

class SignInRepoImpl implements SignInRepo {
  SignInRemoteDataSource signInRemoteDataSource;
  UserLocalDataSource userLocalDataSource;

  SignInRepoImpl(this.signInRemoteDataSource, this.userLocalDataSource);

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required bool cache,
  }) async {
    try {
      UserEntity user = await signInRemoteDataSource.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = user.toModel();

      cache ? userLocalDataSource.cacheUser(userModel) : null;

      return right(userModel);
    }catch(e){
      return left(NetWorkServiceErrorHandler.convertExceptionsToFailure(e));
    }


    on Failure catch (failure) {
      return left(failure);
    }

  }
}
