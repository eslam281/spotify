import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/auth/user.dart';

import '../../../domain/usecases/auth/get_user.dart';
import '../../../service_locator.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await sl<GetUserUseCase>().call();

    user.fold(
      (l) => emit(ProfileInfoFailure()),
      (r) => emit(ProfileInfoLoaded(userEntity: r)),
    );
  }
}
