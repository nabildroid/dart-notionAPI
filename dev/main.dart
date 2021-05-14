import 'schemas/pomodoro_schema.dart';
import 'workspace.dart';

void main() async {
  final workspace = WorkSpace('hello world');
  final props = await workspace.pomodoro.getProps();
  print(props.done);

  await workspace.notes.setProps(PomodoroProperties(
    done: false,
  ));

  final items = await workspace.users.getItems();
  items.forEach((item) {
    final page = item.page;
    page.setProps(
      PomodoroProperties(title: item.props.title + '1'),
    );
  });
}
