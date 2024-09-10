import 'package:flutter/material.dart';
import 'package:job_tracker/widgets/custom_appbar.dart';

class AddApplicationStage extends StatelessWidget {
  const AddApplicationStage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Add Stage"),
      body: Placeholder(),
    );
  }
}
