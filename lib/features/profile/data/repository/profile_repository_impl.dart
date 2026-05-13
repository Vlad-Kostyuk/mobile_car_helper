import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../../domain/model/user_profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../source/remote/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._dataSource);

  final ProfileRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, UserProfile?>> fetchProfile(String userId) async {
    try {
      return Right(await _dataSource.fetchProfile(userId));
    } on PostgrestException catch (e) {
      return Left(Failure.auth(e.message));
    } on SocketException {
      return const Left(Failure.network(''));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> updateProfile(UserProfile profile) async {
    try {
      return Right(await _dataSource.updateProfile(profile));
    } on PostgrestException catch (e) {
      return Left(Failure.auth(e.message));
    } on SocketException {
      return const Left(Failure.network(''));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}
