import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';
import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signin(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createuserReq)async {
    return await sl<AuthFirebaseService>().signup(createuserReq);
  }

}