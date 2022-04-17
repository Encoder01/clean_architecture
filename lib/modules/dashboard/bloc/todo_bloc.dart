import 'package:bloc/bloc.dart';
import 'package:interview_test_project/modules/dashboard/models/todo.dart';
import 'package:interview_test_project/utils/services/user_services.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is TodoGet) {
        List<TodoModel> todos = await UserServices().getTodos();
        emit(TodoLoaded(todos: todos));
      } else if (event is TodoAdd) {
        List<TodoModel> todos = await UserServices().addTodo(event.todo, event.todo.id);
        emit(TodoLoaded(todos:todos));
      } else if (event is TodoUpdate) {
        List<TodoModel> todos = await UserServices().updateTodo(event.id, event.todo);
        emit(TodoLoaded(todos: todos));
      } else if (event is TodoDelete) {
        List<TodoModel> todos = await UserServices().deleteTodo(event.id);
        emit(TodoLoaded(todos: todos));
      }
    });
  }
}
