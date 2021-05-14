import 'interfaces/iclient.dart';
import 'schema.dart';
import 'page.dart';

class _Item<T extends Schema> {
  final T props;
  final Page<T> page;

  _Item(this.props, this.page);
}

abstract class Database<T extends Schema> {
  final IClient _client;
  final String id;

  Database(
    this._client,
    this.id,
  );

  Future<Schema> getProps() async {
    final data = await _client.getDatabase(id);
    // todo add title to the schema!, the problem is, the title cloud have different name in the pages, its not always under the name of "tile"
    return Schema(data);
  }

  Future<List<_Item<T>>> getItems({bool all = false}) async {
    final data = await _client.getDatabaseItems(id);
    final items = data['results'] as List<dynamic>;

    return items.map((item) {
      final page = createPage(_client, item['id']);
      return _Item(
        page.propsFromMap(data),
        page,
      );
    }).toList();
  }

  Page<T> createPage(IClient client, String id);

  Future<bool> add(SchemaProperties props) {
    final data = props.toMap();
    return _client.addDatabaseEntry(id, data);
  }
}
