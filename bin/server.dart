import 'package:http/http.dart' as http;

import 'interfaces/iserver.dart';

enum METHOD { POST, GET, PATCH, DELETE }

enum TARGET {
  PAGE,
  BLOCK,
  DATABASE,
  USER,
}

String _target2string(TARGET target) {
  switch (target) {
    case TARGET.BLOCK:
      return 'blocks';
    case TARGET.DATABASE:
      return 'databases';
    case TARGET.PAGE:
      return 'pages';
    case TARGET.USER:
      return 'uses';
    default:
      throw ('unknown target');
  }
}

class Server implements IServer {
  final endpoint = 'https://api.notion.com/v1';

  Uri _parseUrl(TARGET target, String? id) {
    var url = '$endpoint/${_target2string(target)}/${id ?? ""}';
    if (target == TARGET.BLOCK) {
      url += '/children';
    }

    return Uri.parse(url);
  }

  @override
  Future<http.Response> request(String auth, METHOD method, TARGET target,
      String? id, Map<String, dynamic>? data) {
    final url = _parseUrl(target, id);

    final headers = {
      'Authorization': 'Bearer $auth',
    };

    switch (method) {
      case METHOD.GET:
        return http.get(url, headers: headers);
      case METHOD.POST:
        return http.post(url, headers: headers, body: data);
      case METHOD.PATCH:
        return http.patch(url, headers: headers, body: data);
      case METHOD.DELETE:
        return http.delete(url, headers: headers);
      default:
        throw ("method doesn't exists");
    }
  }
}
