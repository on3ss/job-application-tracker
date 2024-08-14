import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDateTimeField extends StatelessWidget {
  final bool autofocus;
  final String name;
  final String label;
  final String hint;
  final String helper;
  final int minLines;
  final int maxLines;
  final TextInputAction textInputAction;
  final InputType inputType;

  const CustomDateTimeField({
    super.key,
    required this.name,
    required this.label,
    required this.hint,
    required this.helper,
    this.autofocus = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.inputType = InputType.both,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: FormBuilderDateTimePicker(
        autofocus: autofocus,
        name: name,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          helperText: helper,
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        minLines: minLines,
        maxLines: maxLines,
        inputType: inputType,
        textInputAction: textInputAction,
      ),
    );
  }
}
