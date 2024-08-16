import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class OrganisationSelectOrCreate extends StatefulWidget {
  final String name;
  final List<String> items;
  final String? initialValue;
  final FormFieldValidator<String>? validator;

  const OrganisationSelectOrCreate({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.validator,
  });

  @override
  OrganisationSelectOrCreateState createState() =>
      OrganisationSelectOrCreateState();
}

class OrganisationSelectOrCreateState
    extends State<OrganisationSelectOrCreate> {
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: widget.name,
      initialValue: widget.initialValue,
      validator: widget.validator,
      decoration: const InputDecoration(
        labelText: 'Organisation',
        border: OutlineInputBorder(),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList()
        ..add(const DropdownMenuItem<String>(
          value: 'new',
          child: Text('Add New...'),
        )),
      onChanged: (value) {
        if (value == 'new') {
          _showCreateNewDialog(context);
        }
      },
    );
  }

  void _showCreateNewDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();

    String? newValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Organisation'),
          content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(hintText: 'Enter new organisation'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );

    if (newValue != null && newValue.isNotEmpty) {
      setState(() {
        items.add(newValue);
      });

      // Update the form field with the new value
      // ignore: use_build_context_synchronously
      final formState = FormBuilder.of(context);
      formState?.fields[widget.name]?.didChange(newValue);
    }
  }
}
