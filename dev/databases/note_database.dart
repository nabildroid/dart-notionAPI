import '../../bin/database.dart';
import '../../bin/page.dart';
import '../../bin/interfaces/iclient.dart';
import '../pages/note_page.dart';
import '../schemas/note_schema.dart';

class NoteDatabase extends Database<NoteSchema> {
  NoteDatabase(IClient client, String id) : super(client, id);

  @override
  Page<NoteSchema> createPage(IClient client, String id) =>
      NotePage(client, id);
}
