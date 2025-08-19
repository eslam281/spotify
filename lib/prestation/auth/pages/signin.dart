import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/prestation/auth/pages/signup.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
import '../../../core/configs/assets/app_images.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(title: Image.asset(AppImages.logo,scale:1.8,),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(height: 50,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 33,),
            BasicAppButton(title: "Sign In", onPressed: () {

            },),

          ],),
      ),

    );
  }
  Widget _signInText(){
    return const Text("Sign in",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize:30,fontWeight:FontWeight.bold));
  }
  Widget _emailField(BuildContext context){
    return TextField(
      decoration:const InputDecoration(
          hintText:"Enter Email"
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration:const InputDecoration(
          hintText:"Password"
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _signupText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Not A Member ? ",style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.w500)),
          TextButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>   SignUp(),));
          }, child: const Text("Register Now",style: TextStyle(color:Colors.blue
              ,fontSize: 14,fontWeight: FontWeight.w900),))
        ],),
    );
  }
}
