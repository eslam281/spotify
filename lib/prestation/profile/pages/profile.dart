import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

import '../../../common/widgets/appbbar/app_bar.dart';
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
        _profileIfo(context)
        
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
}
