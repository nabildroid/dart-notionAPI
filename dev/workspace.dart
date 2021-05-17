import 'package:dartNotionAPI/dart-notionAPI.dart';

import 'databases/name_database.dart';
import 'pages/name_page.dart';

class WorkSpace extends Client {
  late NamePage names;
  late NameDatabase nameDB;
  WorkSpace(
    String auth, {
    required String namesId,
    required String namesDBId,
  }) : super(auth) {
    names = NamePage(this, namesId);
    nameDB = NameDatabase(this, namesDBId);
  }
}
