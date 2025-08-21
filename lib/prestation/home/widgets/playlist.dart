import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/prestation/home/bloc/play_list_cubit.dart';

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
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Playlist"),
                    Text("See More"),
                  ],
                )
              ],),
            );
          }
          if(state is PlayListLoadFailure)return Text(state.error);
          return const Text("");
        },
      ),
    );
  }
  Widget _playlist(){
    return Container();
  }
}
