import 'package:dartNotionAPI/dart-notionAPI.dart';

import '../pages/name_page.dart';
import '../schemas/name_schema.dart';

class NameDatabase extends Database<NameSchema> {
  NameDatabase(Client client, String id) : super(client, id);

  @override
  Page<NameSchema> createPage(IClient client, String id) =>
      NamePage(client, id);
}
