import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthRepository{
  Future <void> signup(CreateUserReq createuserReq);
  Future <void> signin();
}