import 'package:flutter/material.dart';

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
              print(textFieldController.text);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
