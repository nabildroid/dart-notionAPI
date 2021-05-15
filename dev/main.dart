import 'schemas/note_schema.dart';
import '../bin/schema.dart';
import 'schemas/pomodoro_schema.dart';
import 'workspace.dart';

const auth = '';

void main() async {
  final workspace = WorkSpace(auth);
  final props = await workspace.names.getProps();
  print('title       : ' + props.name.value);
  print('description : ' + props.desc.value);
  print('year        : ' + props.year.value.toInt().toString());
  print('tag         : ' + props.tags.value.toString());
  print('context     : ' + props.context.value.toString());
  print('is done     : ' + props.done.value.toString());
}
