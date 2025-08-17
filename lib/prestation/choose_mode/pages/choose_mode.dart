import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBG),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(40),
          ),
          Padding( padding: const EdgeInsets.all(40),
            child:  Column(children: [
              Align(alignment:Alignment.topCenter,
                  child: Image.asset(AppImages.logo,scale: 1.8,)),
              const Spacer(),
              const Text("Choose Mode",style:
              TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 18),),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                          child: Container(
                            width: 73, height: 73,
                            decoration: const BoxDecoration(
                              color: Color(0xff30393c),
                              shape: BoxShape.circle
                            ),
                            child:SvgPicture.asset(AppVectors.moon,
                           fit:BoxFit.none,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("Light mode",style: TextStyle(color: Colors.grey
                        ,fontSize: 17,fontWeight: FontWeight.w500))
                  ],
                ),

                const SizedBox(width: 71,),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                            child: Container(
                              width: 73, height: 73,
                              decoration: const BoxDecoration(
                                  color: Color(0xff30393c),
                                  shape: BoxShape.circle
                              ),
                              child:SvgPicture.asset(AppVectors.sun,
                                fit:BoxFit.none,),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text("Dark mode",style: TextStyle(color: Colors.grey
                          ,fontSize: 17,fontWeight: FontWeight.w500))
                    ],
                  ),

              ],),
              const SizedBox(height: 50,),
              BasicAppButton(title: "Continue", onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ChooseMode(),));
              }),
            ],),)
        ],
      ),
    );
  }
}
