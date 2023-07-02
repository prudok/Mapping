import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/firebase_instance.dart';
import '../../../register/domain/entities/user_registration_info.dart';

part 'home_cubit.freezed.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Future<void> loadUserDetails(String email) async {
    emit(const HomeState.loading());
    await fbFireStore.getUserDetails(email).then(
          (userDetails) => emit(HomeState.loaded(user: userDetails)),
        );
  }

  Future<void> signOut() async {
    return await fbAuth.signOut();
  }
}
