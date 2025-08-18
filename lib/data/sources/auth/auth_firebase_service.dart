import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
  Future<void> signup(CreateUserReq createuserReq);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createuserReq) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createuserReq.email,
          password: createuserReq.passeword
      );

    }on FirebaseAuthException catch(e){

    }
  }

}