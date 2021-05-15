import 'schemas/name_schema.dart';
import 'schemas/note_schema.dart';
import '../bin/schema.dart';
import 'schemas/pomodoro_schema.dart';
import 'workspace.dart';

const auth = 'secret_Xik0SM87q2OaDXreJexf0WdkjmI2VBCNpJi7RNwrsSL';

void main() async {
  final workspace = WorkSpace(auth);
  final props = await workspace.names.getProps();
  print('title       : ' + props.name.value);
  print('description : ' + props.desc.value);
  print('year        : ' + props.year.value.toInt().toString());
  print('tag         : ' + props.tags.value.toString());
  print('context     : ' + props.context.value.toString());
  print('is done     : ' + props.done.value.toString());

  await workspace.names.setProps(NameProperties(
    name: Text(props.name.value + '!', isTitle: true),
    year: Number(props.year.value * 10),
    context: MultiSelect(
      [Contexts.learning],
      option: NameSchema.contextsOptions(),
    ),
    desc: Text(DateTime.now().toIso8601String()),
    tags: Select(Tags.person, option: NameSchema.tagsOptions()),
    done: CheckBox(!props.done.value),
  ));
}
