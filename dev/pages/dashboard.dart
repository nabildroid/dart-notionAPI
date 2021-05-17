import 'package:dartNotionAPI/dart-notionAPI.dart';

class DashboardPage extends Page {
  DashboardPage(IClient client, String id)
      : super(
          client: client,
          id: id,
        );

  @override
  Schema propsFromMap(Map<String, dynamic> data) {
    return Schema(data);
  }
}
