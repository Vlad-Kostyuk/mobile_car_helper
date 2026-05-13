import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/failure.dart';
import '../models/user_profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, UserProfile?>> fetchProfile(String userId);
  Future<Either<Failure, UserProfile>> updateProfile(UserProfile profile);
}
