import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/quran/quran.dart';
import '../bloc/news_quran_cubit.dart';

class NewsQuran extends StatelessWidget {
  const NewsQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return NewsQuranCubit()..getNewsQuran();
      },
      child: SizedBox(
        height: 200,
        child:BlocBuilder<NewsQuranCubit, NewsQuranState>(
          builder: (_,stat) {
            if(stat is NewsQuranLoading)return const Center(child: CircularProgressIndicator());
            if(stat is NewsQuranLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _quran(stat.quran),
              );
            }
            if(stat is NewsQuranLoadFailure)return Text(stat.error);
            return const Text("");
          }
        )
      ),
    );
  }
  Widget _quran(List<QuranEntity> quran){
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
        SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        color:context.isDarkMode?Colors.white:Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                              "${AppURLs.imageCover}${quran[index].title}.png"),)
                    ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40, width: 40,
                      transform: Matrix4.translationValues(0, 10, 0),
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        color:context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6),
                      ),
                      child: Icon(Icons.play_arrow,
                        color:context.isDarkMode?const Color(0xff959595):const Color(0xff555555,),
                    ),
                  )
                ),
              ),),
              const SizedBox(height: 10,),
              Text(quran[index].title,style: const
              TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
              const SizedBox(height: 5,),
              Text(quran[index].reader,style: const
              TextStyle(fontSize: 14)),
            ]
          ),
        ),
        separatorBuilder: (context, index) =>const SizedBox(width: 14,) ,
        itemCount: quran.length);
  }
}
