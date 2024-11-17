import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';

Future<void> displayTextInputDialog(BuildContext context) async {
  final TextEditingController textFieldController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: const Text('Add Task:'),
        content: TextField(
          maxLines: null,
          minLines: 1,
          controller: textFieldController,
          decoration: const InputDecoration(
            hintText: "Enter your task here",
          ),
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            print(textFieldController.text);
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              BlocProvider.of<TodoCubit>(context)
                  .addTodo(textFieldController.text.trim());
              // Use the text that the user has entered into the text field.
              print(textFieldController.text.trim());
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
