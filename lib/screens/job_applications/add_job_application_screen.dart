import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:job_tracker/dev_only/dummy_data.dart';
import 'package:job_tracker/screens/job_applications/widgets/organisation_dropdown.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';
import 'package:job_tracker/widgets/custom_date_field.dart';
import 'package:job_tracker/widgets/custom_text_field.dart';

class AddJobApplicationScreen extends HookWidget {
  AddJobApplicationScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final organisations = useMemoized(
      () => List.generate(5, (index) => generateOrganisation().name),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Application"),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const PostField(),
              const DescriptionField(),
              const ApplicationDateField(),
              OrganisationSelectOrCreate(
                name: 'organisation',
                items: organisations,
              ),
              const SizedBox(height: 32),
              SaveButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class PostField extends StatelessWidget {
  const PostField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      autofocus: true,
      name: 'post',
      label: 'Post',
      hint: 'Post',
      helper: 'Name of the post you\'re applying for',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(4),
      ]),
    );
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      autofocus: true,
      name: 'description',
      label: 'Description',
      hint: 'Description',
      helper: 'Description for the post',
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(8),
      ]),
      minLines: 3,
      maxLines: 3,
    );
  }
}

class ApplicationDateField extends StatelessWidget {
  const ApplicationDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDateTimeField(
      name: 'applicationDate',
      label: 'Application Date',
      hint: 'Application Date',
      helper: 'Date on which you\'ve applied for this post',
      inputType: InputType.date,
      lastDate: DateTime.now(),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}

class SaveButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const SaveButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.saveAndValidate() ?? false) {
          final formData = formKey.currentState?.value;
          // Handle form submission logic here, e.g., save to database or API
          print(formData);
        } else {
          //
          print('Validation failed');
        }
      },
      child: const Text('Save'),
    );
  }
}
