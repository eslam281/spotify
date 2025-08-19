import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createuserReq);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createuserReq) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createuserReq.email,
          password: createuserReq.password
      );
      return const Right("SignUp was Successful");
    }on FirebaseAuthException catch (e) {
      String message ='';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

}