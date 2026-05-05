abstract interface class VehiclesLocalDataSource {
  Future<List<Map<String, dynamic>>> getAll(String userId);
  Future<Map<String, dynamic>?> getById(String id);
  Future<void> save(Map<String, dynamic> data);
  Future<void> delete(String id);
}
