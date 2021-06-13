import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_02/todo_data/cubit_data.dart';
import 'package:midterm_02/router/app_router.dart';
import 'package:midterm_02/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TodoDataCubit>(
        create: (context) => TodoDataCubit(),
      )
    ],
    child: MaterialApp(
      title: 'Todo App',
      onGenerateRoute: AppRouter().onGenerateRoute,
    ),
  ));
}
