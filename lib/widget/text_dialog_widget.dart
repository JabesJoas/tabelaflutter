import 'package:flutter/material.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  var notacontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    notacontroller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content: TextField(
          controller: notacontroller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text('Done'),
            onPressed: () {
              if (double.parse(notacontroller.text) == null) {
                return;
              }
              if (double.parse(notacontroller.text) > 10 ||
                  double.parse(notacontroller.text) < 0) {
                return;
              } else {
                Navigator.of(context).pop(
                  double.parse(notacontroller.text),
                );
              }
            },
          )
        ],
      );
}
