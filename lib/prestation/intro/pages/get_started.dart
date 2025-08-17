import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/prestation/choose_mode/pages/choose_mode.dart';

import '../../../core/configs/assets/app_images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBG),
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
            const Text("Enjoy Listening To Music",style:
            TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 18),),
            const SizedBox(height: 21,),
            const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam."
              ,style: TextStyle(color: Colors.grey,fontSize: 16),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            BasicAppButton(title: "Get Started", onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ChooseMode(),));
            }),
          ],),)
        ],
      ),
    );
  }
}
