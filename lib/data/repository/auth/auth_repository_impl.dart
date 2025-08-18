import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';
import '../../models/auth/create_user_req.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createuserReq)async {
    await sl<AuthFirebaseService>().signup(createuserReq);
  }

}