import 'package:dartNotionAPI/dart-notionAPI.dart';
import '../schemas/name_schema.dart';
import '../schemas/note_schema.dart';

class NamePage extends Page<NameSchema> {
  NamePage(IClient client, String id) : super(client: client, id: id);

  /// data comes as JsonDecode(Reponse.body) from Notion API
  // todo better function name, what the heck is "Map" !!!!
  @override
  NameSchema propsFromMap(Map<String, dynamic> data) => NameSchema(
        data,
        name: Text.fromData(data, key: 'name', isTitle: true),
        desc: Text.fromData(data, key: 'desc'),
        year: Number.fromData(data, key: 'year'),
        context: MultiSelect.fromData(
          data,
          key: 'context',
          option: NameSchema.contextsOptions(),
        ),
        tags: Select.fromData(
          data,
          key: 'Tags',
          option: NameSchema.tagsOptions(),
        ),
        done: CheckBox.fromData(data, key: 'done'),
      );
}
