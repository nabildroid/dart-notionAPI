import 'package:dartNotionAPI/dart-notionAPI.dart';

enum COLORS { red, blue, orage }

class NoteProperties extends SchemaProperties {
  final String? description;
  final Select<COLORS>? color;
  final String? imageUrl;
  final String? title;

  NoteProperties({
    this.title,
    this.description,
    this.color,
    this.imageUrl,
  });

  @override
  Map<String, dynamic> toMap() {
    return createMap({
      'desc': description,
      'color': color,
      'image': imageUrl,
    });
  }
}

class NoteSchema extends Schema implements NoteProperties {
  @override
  final String title;
  @override
  final String description;
  @override
  final Select<COLORS> color;
  @override
  final String imageUrl;

  NoteSchema(
    Map<String, dynamic> data, {
    required this.title,
    required this.description,
    required this.color,
    required this.imageUrl,
  }) : super(data);

  static Map<COLORS, String> colorOptions() => {
        COLORS.blue: 'blue',
        COLORS.orage: 'orange',
        COLORS.red: 'red',
      };

  @override
  Map<String, dynamic> createMap(Map<String, dynamic> props) {
    // TODO: implement createMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
