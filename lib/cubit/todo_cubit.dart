import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      emitError('Task cannot be empty');
      return;
    }

    if (state.any((todo) => todo.name == title)) {
      emitError('Task already exists');
      return;
    }

    final todo = ToDo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void emitError(String message) {
    // Custom method to emit an error state
    addError(Exception(message), StackTrace.current);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // Emit current state to trigger listener and handle the error
    emit(state);
    super.onError(error, stackTrace);
  }

  void removeTodo(ToDo todo) {
    emit(state.where((t) => t != todo).toList());
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    super.onChange(change);
  }
}
