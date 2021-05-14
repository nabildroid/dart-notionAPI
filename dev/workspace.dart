import './pages/pomodoro_page.dart';
import '../bin/client.dart';
import '../bin/database.dart';
import 'databases/note_database.dart';
import 'pages/dashboard.dart';
import 'schemas/note_schema.dart';

class WorkSpace extends Client {
  late PomodoroPage pomodoro;
  late PomodoroPage notes;
  late DashboardPage dashboard;

  late NoteDatabase notedb;

  WorkSpace(String auth) : super(auth) {
    pomodoro = PomodoroPage(this, 'dfeff');
    notes = PomodoroPage(this, 'dedede');
    notedb = NoteDatabase(this, 'feferfrf');
    dashboard = DashboardPage(this, 'fefef');
  }
}
