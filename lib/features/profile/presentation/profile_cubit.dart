import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './model/profile_view_model.dart';

@injectable
class ProfileCubit extends Cubit<ProfileViewModel> {
  ProfileCubit() : super(const ProfileViewModel());
}
