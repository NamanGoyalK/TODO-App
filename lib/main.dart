import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/home_page.dart';
import 'package:todo/models/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TodoCubit(),
        ),
      ],
      child: BlocListener<TodoCubit, List<ToDo>>(
        listener: (context, state) {
          final cubit = context.read<TodoCubit>();

          // Listen for errors in the Cubit stream
          cubit.stream.listen((event) {}, onError: (error) {
            // Show error message in a Snackbar
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: Colors.red,
                ),
              );
            }
          });
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: const ColorScheme.dark(),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'TODO'),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
