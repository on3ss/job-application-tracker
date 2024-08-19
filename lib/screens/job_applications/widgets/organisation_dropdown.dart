import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:job_tracker/widgets/custom_text_field.dart'; // Ensure CustomTextField is adapted or replaced

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
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: FormBuilderDropdown<String>(
        name: widget.name,
        initialValue: widget.initialValue,
        validator: widget.validator,
        decoration: const InputDecoration(
          labelText: 'Organisation',
          hintText: 'Organisation',
          helperText: 'The organisation you\'re applying into',
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
            _showCreateNewBottomSheet(context);
          }
        },
      ),
    );
  }

  void _showCreateNewBottomSheet(BuildContext context) async {
    final screenHeight = MediaQuery.of(context).size.height;
    final newValue = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: screenHeight * 0.5,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'New Organisation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const CustomTextField(
                name: 'organisation',
                label: 'Organisation',
                hint: 'Organisation',
                helper: 'Enter organisation name',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_textController.text);
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ],
          ),
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
