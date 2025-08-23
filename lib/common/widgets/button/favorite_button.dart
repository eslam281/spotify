import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/quran/quran.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../bloc/favorite_button/favorite_button_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final QuranEntity quranEntity ;
  const FavoriteButton({super.key, required this.quranEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => FavoriteButtonCubit(),
    child:BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(builder: (context, state) {
      if (state is FavoriteButtonInitial) {
        return IconButton(onPressed: () {
          context.read<FavoriteButtonCubit>().
          favoriteButtonUpdated(quranEntity.quranId);
        }, icon:  Icon(quranEntity.isFavorite? Icons.favorite:
        Icons.favorite_border,
          color: AppColors.darkGrey,));
      }
      if (state is FavoriteButtonUpdated) {
        return IconButton(onPressed: () {
          context.read<FavoriteButtonCubit>().
          favoriteButtonUpdated(quranEntity.quranId);
        }, icon:  Icon(state.isFavorite? Icons.favorite:
        Icons.favorite_border,
          color: AppColors.darkGrey,));
      }
      return Container();
    },));
  }
}
