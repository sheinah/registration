import 'package:flutter/material.dart';
import 'package:registration/app_values/double_size.dart';
import 'package:registration/widgets/form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _thainameController = TextEditingController();
  final TextEditingController _thaisurnameController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _villageNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: fifty, vertical: fifty),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Registration Form / แบบฟอร์มลงทะเบียน',
                style: TextStyle(fontSize: fontTwenty, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: thirty),
              englishName(),
              thaiName(),
              addressForm(
                context,
                'Address: ',
                _houseNumberController,
                _villageNumberController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget englishName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameForm(context, 'English Name ', 'Name', _nameController),
        nameForm(context, 'English Surname ', 'Surname', _surnameController),
      ],
    );
  }

  Widget thaiName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameForm(context, 'ชื่อภาษาไทย ', 'ชื่อ', _thainameController),
        nameForm(context, 'นามสกุลภาษาไทย ', 'นามสกุล', _thaisurnameController),
      ],
    );
  }

  Widget address() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }
}
