import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
import '../../../core/configs/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        backgroundColor: Color(0xff2C2828),
        title: Text("Profile",
          style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
      ),
      body: Column(children: [
        _profileIfo(context)
        
      ],)
    );
  }
  Widget _profileIfo(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height  /3.5,
      decoration: BoxDecoration(
        color:context.isDarkMode?const Color(0xff2C2828):Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      )
    );
  }
}
