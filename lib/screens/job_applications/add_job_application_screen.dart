import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';
import 'package:job_tracker/widgets/custom_date_field.dart';
import 'package:job_tracker/widgets/custom_text_field.dart';

class AddJobApplicationScreen extends StatelessWidget {
  AddJobApplicationScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Application"),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                autofocus: true,
                name: 'post',
                label: 'Post',
                hint: 'Post',
                helper: 'Name of the post you\'re applying for',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(4),
                ]),
              ),
              CustomTextField(
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
              ),
              const CustomDateTimeField(
                name: 'applicationDate',
                label: 'Application Date',
                hint: 'Application Date',
                helper: 'Date on which you\'ve applied for this post',
                inputType: InputType.date,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
