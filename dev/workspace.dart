import './pages/pomodoro_page.dart';
import '../bin/client.dart';
import 'databases/note_database.dart';
import 'pages/dashboard.dart';
import 'pages/name_page.dart';

class WorkSpace extends Client {
  late NamePage names;

  WorkSpace(String auth) : super(auth) {
    names = NamePage(this, '67898b4507e4469aaeee312c4d23967b');
  }
}
