import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final bool autofocus;
  final String name;
  final String label;
  final String hint;
  final String helper;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String?)? onChanged;

  const CustomTextField({
    super.key,
    required this.name,
    required this.label,
    required this.hint,
    required this.helper,
    this.validator,
    this.autofocus = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: FormBuilderTextField(
        autofocus: autofocus,
        name: name,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          helperText: helper,
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
      ),
    );
  }
}
