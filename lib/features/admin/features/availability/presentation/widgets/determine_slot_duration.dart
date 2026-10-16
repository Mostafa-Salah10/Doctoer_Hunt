import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor_hunt/gen/strings.g.dart';

Future<int?> showSlotDurationDialog(BuildContext context, int initial) {
  final controller = TextEditingController(text: initial.toString());

  return showDialog<int>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.t.slotDuration),
      content: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          hintText: context.t.slotDurationExample,
          suffixText: context.t.minutes,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.t.cancel),
        ),
        TextButton(
          onPressed: () {
            final value = int.tryParse(controller.text);
            if (value != null && value > 0) {
              Navigator.pop(context, value);
            }
          },
          child: Text(context.t.save),
        ),
      ],
    ),
  );
}
