import 'schemas/name_schema.dart';
import 'workspace.dart';

const auth = 'secret_Xik0SM87q2OaDXreJexf0WdkjmI2VBCNpJi7RNwrsSL';

void main() async {
  final workspace = WorkSpace(
    auth,
    namesId: 'be2caf9c87fe4189a1cf22ff6d50e0ba',
    namesDBId: '30c82a4f72804c9aa90bf2a859891ee5',
  );

  final pages = await workspace.nameDB.getItems();

  await workspace.nameDB.add(NameProperties.fromValues(
    name: 'hello world',
    done: false,
  ));

  await pages[0].page.setProps(
        NameProperties.fromValues(
          year: DateTime.now().year.toDouble(),
        ),
      );
  pages.forEach((page) {
    final props = page.props;
    print('--------------');
    print('title       : ' + props.name.value);
    print('description : ' + props.desc.value);
    print('year        : ' + props.year.value.toInt().toString());
    print('tag         : ' + props.tags.value.toString());
    print('context     : ' + props.context.value.toString());
    print('is done     : ' + props.done.value.toString());
  });
}
