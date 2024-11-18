import 'package:json_annotation/json_annotation.dart';
import 'package:shared/src/domain/entities/todo.dart';
part 'todo_model.g.dart';
@JsonSerializable()
class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    super.completed = false
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
  Map<String,dynamic> toJson() => _$TodoModelToJson(this);
}
