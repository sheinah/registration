import 'package:flutter/material.dart';
import 'package:registration/app_values/app_colors.dart';
import 'package:registration/app_values/double_size.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: thirty, vertical: fifty),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Registration Form / แบบฟอร์มลงทะเบียน',
                style: TextStyle(fontSize: fontTwenty, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: thirty),
              nameForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Name ',
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: red),
              ),
            ],
          ),
        ),
        const SizedBox(height: ten),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Name',
            ),
          ),
        ),
      ],
    );
  }
}
