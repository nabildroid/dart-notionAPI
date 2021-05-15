import 'dart:convert';

import 'interfaces/iclient.dart';
import 'interfaces/iserver.dart';
import 'server.dart';

class Client implements IClient {
  final String _auth;
  final IServer _server;

  Client(this._auth) : _server = Server();

  @override
  Future<bool> setPageProperties(String id, Map<String, dynamic> data) async {
    try {
      final body = {'properties': data};
      final response =
          await _server.request(_auth, METHOD.PATCH, TARGET.PAGE, id, body);
      return response.statusCode == 200;
    } catch (err) {
      throw ('unable to update properties of page#$id');
    }
  }

  @override
  Future<Map<String, dynamic>> getPageProperties(String id) async {
    try {
      final response =
          await _server.request(_auth, METHOD.GET, TARGET.PAGE, id, null);
      return jsonDecode(response.body);
    } catch (err) {
      throw ('unable to fetch properties from page#$id');
    }
  }

  @override
  Future<Map<String, dynamic>> getDatabase(String id) async {
    try {
      final response =
          await _server.request(_auth, METHOD.GET, TARGET.DATABASE, id, null);
      return jsonDecode(response.body);
    } catch (err) {
      throw ('unable to fetch properties from database#$id');
    }
  }

  @override
  Future<Map<String, dynamic>> getDatabaseItems(String id) async {
    try {
      final response =
          await _server.request(_auth, METHOD.GET, TARGET.DATABASE, id, null);
      return jsonDecode(response.body);
    } catch (err) {
      throw ('unable to fetch entries from database#$id');
    }
  }

  @override
  Future<bool> addDatabaseEntry(String id, Map<String, dynamic> data) async {
    data.addAll({'database_id': id});

    try {
      final response =
          await _server.request(_auth, METHOD.POST, TARGET.PAGE, null, data);
      return response.statusCode == 200;
    } catch (err) {
      throw ('unable to add new entry to database#$id');
    }
  }
}
