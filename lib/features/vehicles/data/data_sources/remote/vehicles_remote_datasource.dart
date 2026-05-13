abstract interface class VehiclesRemoteDataSource {
  Future<List<Map<String, dynamic>>> getAll(String userId);
  Future<Map<String, dynamic>> save(Map<String, dynamic> data);
  Future<void> delete(String id);
}
