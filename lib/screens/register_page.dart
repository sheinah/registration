import 'package:flutter/material.dart';
import 'package:registration/app_values/app_colors.dart';
import 'package:registration/app_values/double_size.dart';
import 'package:registration/widgets/agreement_check.dart';
import 'package:registration/widgets/dropdown_picker.dart';
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

  Color color = grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: fifty, vertical: fifty),
        child: Center(
          child: SingleChildScrollView(
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
                addressForm(context, 'Address: '),
                const CountryPicker(),
                const AgreementCheckBox(),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget englishName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameForm(
          context,
          'English Name ',
          'Name',
          _nameController,
          color,
        ),
        nameForm(
          context,
          'English Surname ',
          'Surname',
          _surnameController,
          color,
        ),
      ],
    );
  }

  Widget thaiName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameForm(
          context,
          'ชื่อภาษาไทย ',
          'ชื่อ',
          _thainameController,
          color,
        ),
        nameForm(
          context,
          'นามสกุลภาษาไทย ',
          'นามสกุล',
          _thaisurnameController,
          color,
        ),
      ],
    );
  }

  Widget submitButton() {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ten),
          ),
        ),
        onPressed: () {
          checkError();
        },
        child: const Text(
          "Submit",
          style: TextStyle(color: white),
        ));
  }

  void checkError() {
    if (_nameController.text.isEmpty ||
        _surnameController.text.isEmpty && (_thainameController.text.isEmpty || _thaisurnameController.text.isEmpty)) {
      setState(() {
        color = red;
      });
    }
  }
}
