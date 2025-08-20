import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

import '../../../core/configs/assets/app_images.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(showArow: false,title: Image.asset(AppImages.logo,scale:1.8,)),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs()
        ],),
      ) ,
    );
  }

  Widget _homeTopCard(){
    return Center(
      child:Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 140,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 75,top: 3),
                  child: Image.asset(AppImages.homeReader,width: 190,),
                ))
        ],
      ),
    );
  }

  Widget _tabs(){
    return TabBar(
      indicatorColor:AppColors.primary,
        unselectedLabelColor:Colors.grey,
      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,
          color:context.isDarkMode?Colors.white :Colors.black ),
      indicatorPadding:const EdgeInsets.symmetric(horizontal: 10) ,
        dividerColor:context.isDarkMode?Colors.black :Colors.white ,
      controller: _tabController,dividerHeight: 2,isScrollable: true,
        labelPadding: const EdgeInsets.only(bottom: 5,right: 48,top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        tabs: const [
      Text("News",),
      Text("Videos",),
      Text("Readers",),
      Text("Podcasts",),
    ]);
  }
}
