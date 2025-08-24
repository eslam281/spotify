import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/prestation/profile/pages/profile.dart';

import '../../../core/configs/assets/app_images.dart';
import '../widgets/news_quran.dart';
import '../widgets/playlist.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

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
      appBar: BasicAppBar(
          showArow: false,title: Image.asset(AppImages.logo,scale:1.8,),
        actions: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => const ProfilePage(),));
        }, icon: const Icon(Icons.person)),

      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            const SizedBox(height: 20,),
            SizedBox(
              height:260,
              child: TabBarView(
                controller:_tabController,
                  children: [
                const NewsQuran(),
                Container(),
                Container(),
                Container(),
              ]),
            ),

            const Playlist()
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
              height: 140,width: 350,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 73),
                  child: Image.asset(AppImages.homeReader,width: 197,),
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
        dividerColor:context.isDarkMode?AppColors.darkBackground :AppColors.lightBackground ,
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
