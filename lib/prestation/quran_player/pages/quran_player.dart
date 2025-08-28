import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbbar/app_bar.dart';

import '../../../common/widgets/button/favorite_button.dart';
import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/quran/quran.dart';
import '../bloc/quran_player_cubit.dart';

class QuranPlayerPage extends StatelessWidget {
  final List<QuranEntity> quranEntity;
   int index;
   QuranPlayerPage({super.key, required this.quranEntity, required this.index});

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
        create: (context) => QuranPlayerCubit(index,quranEntity)..loadQuran(),

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
    return BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
  builder: (context, state) {
    return Container(
        height: MediaQuery.of(context).size.height/2.28,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${AppURLs.imageCover}${quranEntity[context.read<QuranPlayerCubit>().index].title}.png"),)
        )
    );
  },
);
  }
  Widget _quranDetail(){
    return BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
  builder: (context, state) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quranEntity[context.read<QuranPlayerCubit>().index].title,style:
              const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
              const SizedBox(height: 5,),
              Text(quranEntity[context.read<QuranPlayerCubit>().index].reader,style:
              const TextStyle(fontWeight: FontWeight.w400,fontSize: 20,)),
            ],),
          FavoriteButton(quranEntity: quranEntity[context.read<QuranPlayerCubit>().index])
        ]);
  },
);
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
              value: context.read<QuranPlayerCubit>().quranPosition.inSeconds.toDouble(),
              allowedInteraction:SliderInteraction.tapAndSlide,
              onChanged: (value) {
              context.read<QuranPlayerCubit>().audioPlayer.seek(Duration(seconds: value.toInt()));
            },
              onChangeEnd: (value) {
                context.read<QuranPlayerCubit>().nextOrBackQuran(true);
              },
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(context.read<QuranPlayerCubit>().quranPosition)),
                Text(formatDuration(context.read<QuranPlayerCubit>().quranDuration)),
              ],),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {
                  context.read<QuranPlayerCubit>().loopOrNotQuran();

                }, icon: Icon(context.read<QuranPlayerCubit>().loopMode == 1 ?
                Icons.repeat_one_rounded : Icons.cached_rounded,

                  color: context.read<QuranPlayerCubit>().loopMode == 0 ? Colors.grey :
                  context.isDarkMode ? AppColors.lightBackground : AppColors.darkBackground,)
                ),

                IconButton(onPressed: () {
                  context.read<QuranPlayerCubit>().nextOrBackQuran(false);
                }, icon: Icon(Icons.skip_previous_rounded,
                  color: context.isDarkMode? AppColors.lightBackground:AppColors.darkBackground, )),

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
                ),

                IconButton(onPressed: () {
                  context.read<QuranPlayerCubit>().nextOrBackQuran(true);
                }, icon: Icon(Icons.skip_next_rounded,
                  color: context.isDarkMode? AppColors.lightBackground:AppColors.darkBackground, )),

                IconButton(onPressed: () {
                  context.read<QuranPlayerCubit>().isRandom=!context.read<QuranPlayerCubit>().isRandom;
                  context.read<QuranPlayerCubit>().emit(QuranPlayerLoaded());
                },
                  icon: Icon(Icons.shuffle_rounded,
                  color:context.read<QuranPlayerCubit>().isRandom ?
                  context.isDarkMode? AppColors.lightBackground:AppColors.darkBackground :
                  Colors.grey, ),),
              ],
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
