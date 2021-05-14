import 'package:http/http.dart' as http;
import '../server.dart';

abstract class IServer {
  Future<http.Response> request(String auth, METHOD method, TARGET target,
      String? id, Map<String, dynamic>? data);
}
