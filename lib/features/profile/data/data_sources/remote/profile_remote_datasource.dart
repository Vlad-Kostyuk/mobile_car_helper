import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/user_profile.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserProfile?> fetchProfile(String userId);
  Future<UserProfile> updateProfile(UserProfile profile);
}

@LazySingleton(as: ProfileRemoteDataSource)
class SupabaseProfileDataSource implements ProfileRemoteDataSource {
  SupabaseProfileDataSource(this._client);

  final SupabaseClient _client;

  @override
  Future<UserProfile?> fetchProfile(String userId) async {
    final data = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();

    return data != null ? _fromRow(data) : null;
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    final data = await _client
        .from('profiles')
        .upsert({
          'id': profile.id,
          'email': profile.email,
          'display_name': profile.displayName,
          'last_name': profile.lastName,
          'avatar_url': profile.avatarUrl,
          'unit_system': profile.unitSystem == UnitSystem.miles ? 'miles' : 'km',
        })
        .select()
        .single();
    return _fromRow(data);
  }

  UserProfile _fromRow(Map<String, dynamic> row) => UserProfile(
        id: row['id'] as String,
        email: row['email'] as String? ?? '',
        displayName: row['display_name'] as String?,
        lastName: row['last_name'] as String?,
        avatarUrl: row['avatar_url'] as String?,
        unitSystem:
            row['unit_system'] == 'miles' ? UnitSystem.miles : UnitSystem.km,
      );
}
