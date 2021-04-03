import 'package:flutter_advanced_api_calls/api/json_models/todo.dart';
import 'package:flutter_advanced_api_calls/api/json_parsers/json_parser.dart';

class TodoParser extends JsonParser<List<Todo>> with ListDecoder<List<Todo>> {
  const TodoParser();

  @override
  Future<List<Todo>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Todo.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}