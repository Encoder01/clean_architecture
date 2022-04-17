part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}


class TodoGet extends TodoEvent {
  TodoGet();
}

class TodoAdd extends TodoEvent {
  final TodoModel todo;

  TodoAdd({required this.todo});
}

class TodoUpdate extends TodoEvent {
  final String id;
 final TodoModel todo;
  TodoUpdate(this.id,this.todo);
}

class TodoDelete extends TodoEvent {
 final String id;
  TodoDelete(this.id,);
}
