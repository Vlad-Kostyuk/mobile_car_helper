import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../model/user_profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, UserProfile?>> fetchProfile(String userId);
  Future<Either<Failure, UserProfile>> updateProfile(UserProfile profile);
}
