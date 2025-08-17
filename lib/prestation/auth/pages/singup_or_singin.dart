import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';

class SingUpOrSingIn extends StatelessWidget {
  const SingUpOrSingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
          child: Image.asset(AppImages.authBG,scale:.8,),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Expanded(flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: BasicAppButton(title: "Register", onPressed:() {

                    },),
                  ),
                ),
                const SizedBox(width: 20,),
                  Expanded(flex: 1,
                  child: TextButton(onPressed:() {

                  }, child: const Text("Sign in",
                    style:TextStyle(fontSize:19,fontWeight:FontWeight.w500),)),
                )
              ],)
              ]
          )
        ),

      ],),
    );
  }
}
