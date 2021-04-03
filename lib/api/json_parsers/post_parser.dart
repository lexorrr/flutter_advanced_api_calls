import 'package:flutter_advanced_api_calls/api/json_models/post.dart';
import 'package:flutter_advanced_api_calls/api/json_parsers/json_parser.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {
  const PostParser();

  @override
  Future<Post> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Post.fromJson(decoded);
  }
}