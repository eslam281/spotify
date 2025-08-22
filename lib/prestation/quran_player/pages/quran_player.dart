import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbbar/app_bar.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/quran/quran.dart';

class QuranPlayerPage extends StatelessWidget {
  final QuranEntity quranEntity;
  const QuranPlayerPage({super.key, required this.quranEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text("Now playing",
          style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        actions:IconButton(onPressed: () {

        }, icon: Icon(Icons.more_vert_rounded),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 10),
        child: Column(children: [
          _quran(context),
          const SizedBox(height: 20),
          _quranDetail(),

        ],),
      ),
    );
  }
  Widget _quran(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height/2.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "${AppURLs.imageCover}${quranEntity.title}.png"),)
      )
    );
  }
  Widget _quranDetail(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(quranEntity.title,style:
        const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
        const SizedBox(height: 5,),
        Text(quranEntity.reader,style:
        const TextStyle(fontWeight: FontWeight.w400,fontSize: 20,)),
      ],),
      IconButton(onPressed: () {

      }, icon: const Icon(Icons.favorite_outline_outlined,
        size: 30,
        color: AppColors.grey,))
    ]);
  }
}
