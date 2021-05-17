import 'interfaces/iclient.dart';
import 'schema.dart';

abstract class Page<T extends Schema> {
  final IClient client;
  final String id;

  Page({
    required this.client,
    required this.id,
  });

  Future<T> getProps() async {
    final data = await client.getPageProperties(id);
    final schema = propsFromMap(data);
    return schema;
  }

  Future<bool> setProps(SchemaProperties props) async {
    final data = props.toMap();
    return client.setPageProperties(id, data);
  }

  // todo it should take care the notion reponse complexity, hint, use named constructor + property key
  T propsFromMap(Map<String, dynamic> data);
}
