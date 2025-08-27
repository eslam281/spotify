import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
import '../../../common/widgets/button/favorite_button.dart';
import '../../quran_player/pages/quran_player.dart';
import '../bloc/favorite_quran_cubit.dart';
import '../bloc/profile_info_cubit.dart';

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
        _profileIfo(context),
        const SizedBox(height: 30,),
        _favoriteQuran()
        
      ],)
    );
  }

  Widget _profileIfo(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileInfoCubit()..getUser(),
        child: Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.isDarkMode ? const Color(0xff2C2828) : Colors
                  .white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
              builder: (context, state) {
                if (state is ProfileInfoLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProfileInfoLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      height: 90,width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(state.userEntity.imageURL!)
                        )
                      ),
                    ),
                      const SizedBox(height: 15,),
                      Text("${state.userEntity.email}",style:const TextStyle(fontSize: 12),),
                      const SizedBox(height: 10,),
                      Text("${state.userEntity.fullName}",
                      style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  ],);
                }
                if (state is ProfileInfoFailure) {
                  return const Center(child: Text("An error occurred"));
                }
                return const SizedBox();
              },
            )
        )
    );
  }
  Widget _favoriteQuran() {
    return BlocProvider(
  create: (context) => FavoriteQuranCubit()..getFavoriteQuran(),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Favorite Quran",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
      BlocBuilder<FavoriteQuranCubit, FavoriteQuranState>(builder: (context, state) {
        if(state is FavoriteQuranLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is FavoriteQuranLoaded){
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.favoriteQuran.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                  onTap:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            QuranPlayerPage(quranEntity:state.favoriteQuran,index: index,),));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 70,width:70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${AppURLs.imageCover}${state.favoriteQuran[index].title}.png"
                              ),
                            )
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const SizedBox(width: 20,),
                      Column(children: [
                        Text(state.favoriteQuran[index].title,style:
                        const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)),
                        const SizedBox(height: 5,),
                        Text(state.favoriteQuran[index].reader,style:
                        const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,)),
                      ],),
                    ],
                  ),
                ),
                Row(children: [
                  Text(state.favoriteQuran[index].duration.toString().
                  replaceAll('.', ':')),

                  const SizedBox(width: 20,),

                  FavoriteButton(quranEntity: state.favoriteQuran[index],
                  key: UniqueKey(),
                  onPressed: () {
                    context.read<FavoriteQuranCubit>().removeQuran(index);
                  },)
                ],)

              ],);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20,);
            },
          );
        }
        if(state is FavoriteQuranFailure){
          return Center(child: Text("An error occurred ${state.message}"));
        }
        return const SizedBox();
      },)

      ],),
  ),
);
  }
}
