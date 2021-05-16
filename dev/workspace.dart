import './pages/pomodoro_page.dart';
import '../bin/client.dart';
import 'databases/note_database.dart';
import 'pages/dashboard.dart';
import 'pages/name_page.dart';

class WorkSpace extends Client {
  late NamePage names;
  late NoteDatabase nameDB;
  WorkSpace(
    String auth, {
    required String namesId,
    required String namesDBId,
  }) : super(auth) {
    names = NamePage(this, namesId);
    nameDB = NoteDatabase(this, namesDBId);
  }
}
