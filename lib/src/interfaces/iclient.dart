abstract class IClient {
  Future<bool> setPageProperties(String id, Map<String, dynamic> data);

  Future<Map<String, dynamic>> getPageProperties(String id);

  Future<Map<String, dynamic>> getDatabase(String id);

  Future<Map<String, dynamic>> getDatabaseItems(String id);

  Future<bool> addDatabaseEntry(String id, Map<String, dynamic> data);
}
