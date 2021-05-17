import 'package:dartNotionAPI/dart-notionAPI.dart';

import '../schemas/note_schema.dart';

class NotePage extends Page<NoteSchema> {
  NotePage(IClient client, String id) : super(client: client, id: id);

  @override
  NoteSchema propsFromMap(Map<String, dynamic> data) => NoteSchema(
        data,
        title: data['title'],
        description: data['description'],
        color: Select.fromData(
          data,
          key: 'Color',
          option: NoteSchema.colorOptions(),
        ),
        imageUrl: data['url'],
      );
}
