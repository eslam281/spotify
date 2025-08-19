import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/prestation/auth/pages/signin.dart';
import 'package:spotify/prestation/root/pages/root.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../domain/usecases/auth/signup.dart';
import '../../../service_locator.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  final TextEditingController _fullName =TextEditingController();
  final TextEditingController _email =TextEditingController();
  final TextEditingController _password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppBar(title: Image.asset(AppImages.logo,scale:1.8,),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
            _registerText(),
            const SizedBox(height: 50,),
            _fullNameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
              const SizedBox(height: 33,),
              BasicAppButton(title: "Create Account", onPressed: ()async {
                var result =await sl<SignUpUseCase>().call(
                  param: CreateUserReq(
                      fullName: _fullName.text.toString(),
                      email: _email.text.toString(),
                      password: _password.text.toString()
                  )
                );
                result.fold(
            (l){
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                   }, 
            (r) {
                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const RootPage(),),
                          (route) => false,);
                  },
                );
              },),
              
          ],),
        ),
      ),

    );
  }
  Widget _registerText(){
    return const Text("Register",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize:30,fontWeight:FontWeight.bold));
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      controller:_fullName ,
      decoration:const InputDecoration(
        hintText:"Full Name"
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _emailField(BuildContext context){
    return TextField(
      controller:_email,
      decoration:const InputDecoration(
        hintText:"Enter Email"
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      controller:_password,
      decoration:const InputDecoration(
        hintText:"Password"
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _siginText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Do you have an account? ",style: TextStyle(
            fontSize: 14,fontWeight: FontWeight.w500)),
        TextButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  SignIn(),));
        }, child: const Text("Sign In",style: TextStyle(color:Colors.blue
            ,fontSize: 14,fontWeight: FontWeight.w900),))
      ],),
    );
  }
}
