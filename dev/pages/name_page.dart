import '../../bin/page.dart';
import '../../bin/schema.dart';
import '../../bin/interfaces/iclient.dart';
import '../schemas/name_schema.dart';
import '../schemas/note_schema.dart';

class NamePage extends Page<NameSchema> {
  NamePage(IClient client, String id) : super(client: client, id: id);

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
      );
}
