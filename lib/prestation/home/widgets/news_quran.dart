import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              print(stat.quran.length);
              return _quran(stat.quran);
            }
            if(stat is NewsQuranLoadFailure)return Text(stat.error);
            return const Text("");
          }
        )
      ),
    );
  }
  Widget _quran(List<QuranEntity> stat){
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>const Column(
          children: [

          ]
        ),
        separatorBuilder: (context, index) =>const SizedBox(width: 14,) ,
        itemCount: stat.length);
  }
}
