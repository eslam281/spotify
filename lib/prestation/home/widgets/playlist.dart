import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/prestation/home/bloc/play_list_cubit.dart';

import '../../../common/widgets/button/favorite_button.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/quran/quran.dart';
import '../../quran_player/pages/quran_player.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if(state is PlayListLoading)return const Center(child: CircularProgressIndicator());
          if(state is PlayListLoaded) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Playlist",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                    ,
                    Text("See More",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,
                      color: Color(0xff131313)),),
                  ],
                ),
                const SizedBox(height: 20,),
                _playlist( state.quran)
              ],),
            );
          }
          if(state is PlayListLoadFailure)return Text(state.error);
          return const Text("");
        },
      ),
    );
  }
  Widget _playlist(List<QuranEntity> quran){
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          QuranPlayerPage(quranEntity: quran,index: index),));
                },
                child: Row(
                  children: [
                    Container(
                      height: 48, width: 45,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        color:context.isDarkMode?AppColors.darkGrey:const Color(0xffE6E6E6),
                      ),
                      child: Icon(Icons.play_arrow,
                        color:context.isDarkMode?const Color(0xff959595):const Color(0xff555555,),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Column(children: [
                      Text(quran[index].title,style:
                      const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)),
                      const SizedBox(height: 5,),
                      Text(quran[index].reader,style:
                      const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,)),
                    ],),
                  ],
                ),
              ),


              Row(children: [
                Text(quran[index].duration.toString().
                replaceAll('.', ':')),

                const SizedBox(width: 20,),

                FavoriteButton(quranEntity: quran[index])
              ],)
          ],);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20,);
        },
      itemCount: quran.length,

    );
  }
}
