import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/prestation/auth/pages/signin.dart';
import 'package:spotify/prestation/auth/pages/signup.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BasicAppBar(),
        Align(
          alignment:Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topPattern,),
        ),
        Align(
          alignment:Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.bottomPattern,),
        ),
        Align(
          alignment:Alignment.bottomLeft,
          child: Image.asset(AppImages.authBG,scale:.9,),
        ),
        Align(
          alignment:Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo,scale:1.8,),
              const SizedBox(height: 55,),
              const Text("Enjoy listening to music",
                  style: TextStyle(fontSize:26,fontWeight:FontWeight.bold)),
              const SizedBox(height: 21,),
              const Text("Spotify is a proprietary Swedish audio streaming and media services provider ",
                  style: TextStyle(fontSize:17,color: AppColors.grey,),
              textAlign:TextAlign.center,),
              const SizedBox(height: 30,),
              Row(
                children: [
                Expanded(flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: BasicAppButton(title: "Register", onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) =>   SignUp(),));
                    },),
                  ),
                ),
                const SizedBox(width: 20,),
                  Expanded(flex: 1,
                  child: TextButton(onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SignIn(),));
                  }, child: const Text("Sign in",
                    style:TextStyle(fontSize:19,fontWeight:FontWeight.bold),)),
                )
              ],)
              ]
          )
        ),
      ],),
    );
  }
}
