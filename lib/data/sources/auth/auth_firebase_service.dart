import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createuserReq);
  Future<Either> signin(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserReq.email,
          password: signInUserReq.password
      );
      return const Right("Sign in was Successful");
    }on FirebaseAuthException catch (e) {
      String message ='';
      if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      } else if (e.code == 'wrong-credential') {
        message = 'The wrong email or password was provided for that user.';
      }
      return Left(message);
    }
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