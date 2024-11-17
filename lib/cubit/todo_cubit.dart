import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodDo>> {
  TodoCubit() : super([]);
}
