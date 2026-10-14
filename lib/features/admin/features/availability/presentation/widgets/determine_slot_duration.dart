import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<int?> showSlotDurationDialog(BuildContext context, int initial) {
  final controller = TextEditingController(text: initial.toString());

  return showDialog<int>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Slot Duration"),
      content: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          hintText: "e.g. 90",
          suffixText: "Minutes",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            final value = int.tryParse(controller.text);
            if (value != null && value > 0) {
              Navigator.pop(context, value);
            }
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
}
