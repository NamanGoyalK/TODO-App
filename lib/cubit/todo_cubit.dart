import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Task cannot be empty');
      return;
    }

    if (state.any((todo) => todo.name == title)) {
      addError('Task already exists');
      return;
    }

    final todo = ToDo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  void removeTodo(ToDo todo) {
    emit(state.where((t) => t != todo).toList());
  }
}
