import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbbar/app_bar.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/quran/quran.dart';
import '../bloc/quran_player_cubit.dart';

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

        }, icon: const Icon(Icons.more_vert_rounded),),
      ),
      body: BlocProvider(
        create: (context) => QuranPlayerCubit()..loadQuran(
            "${AppURLs.quran}${quranEntity.title}_quran.mp3"),

        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 10),
        child: Column(children: [
          _quran(context),
          const SizedBox(height: 20),
          _quranDetail(),
          const SizedBox(height: 30),
          _quranPlayer(),

        ],),
      ),
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
  Widget _quranPlayer(){
    return BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
      builder: (BuildContext context, QuranPlayerState state) {
        if(state is QuranPlayerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is QuranPlayerLoaded){
          return Column(children: [
            Slider(
              min: 0,padding: const EdgeInsets.symmetric(vertical:12),
              activeColor:context.isDarkMode? AppColors.lightBackground:AppColors.darkBackground,
                max: context.read<QuranPlayerCubit>().quranDuration.inSeconds.toDouble(),
                value: context.read<QuranPlayerCubit>().quranPosition.inSeconds.toDouble()
                , onChanged: (value) {

                },),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(formatDuration(context.read<QuranPlayerCubit>().quranPosition)),
              Text(formatDuration(context.read<QuranPlayerCubit>().quranDuration)),
            ],),
            const SizedBox(height: 20,),

            GestureDetector(
              onTap: () {
                context.read<QuranPlayerCubit>().playOrPauseQuran();
              },
              child: Container(
                width: 72,height: 72,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Icon(context.read<QuranPlayerCubit>().audioPlayer.playing?
                   Icons.pause : Icons.play_arrow ,color: Colors.white,size: 28,),
              ),
            )
          ],);
        }
        if(state is QuranPlayerFailure) {
          return Text("==================== ${state.message}");
        }
        return const SizedBox();
      },
    );
  }
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
