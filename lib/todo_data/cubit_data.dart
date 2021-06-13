import 'package:midterm_02/models/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_02/repositories/todo_repository.dart';
part 'todo_data_state.dart';

class TodoDataCubit extends Cubit<TodoDataState> {
  TodoDataCubit() : super(TodoDataInitial());
  final todoRepository = TodoRepository();

  Future<void> readAll() async {
    emit(TodoDataInitial());
    try {
      var todos = await todoRepository.readAll();
      emit(TodoDataLoaded(
        todos: todos,
      ));
    } catch (e) {
      emit(TodoDataError(
        message: e.toString(),
      ));
    }
  }

  Future<void> create(Todo todo) async {
    emit(TodoDataInitial());
    try {
      await todoRepository.create(todo);
    } catch (e) {
      emit(TodoDataError(
        message: e.toString(),
      ));
    }
  }

  Future<void> delete(String docId) async {
    emit(TodoDataInitial());
    try {
      await todoRepository.delete(docId);
    } catch (e) {
      emit(TodoDataError(
        message: e.toString(),
      ));
    }
  }
}
