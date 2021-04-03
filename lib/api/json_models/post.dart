import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

// To generate code:
// add build_runner (build_runner: ^1.12.2) to pubspec.yaml
// run in the terminal: 'flutter pub run build_runner build'
// or run 'flutter pub run build_runner watch'
// to automatically generate code on saving the file
@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  const Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
