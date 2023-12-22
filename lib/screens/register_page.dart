import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:registration/app_values/app_colors.dart';
import 'package:registration/app_values/double_size.dart';
import 'package:registration/widgets/agreement_check.dart';
import 'package:registration/widgets/dropdown_picker.dart';
import 'package:registration/widgets/form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = "/register-page";

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
                haveAccount(),
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

  Widget haveAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: thirty),
      child: RichText(
        text: TextSpan(
          text: "I have an account. ",
          children: [
            TextSpan(
                text: "Sign in",
                style: const TextStyle(
                  color: green,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.popAndPushNamed(context, "/log-in-page");
                  }),
          ],
        ),
      ),
    );
  }

  Widget submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ten),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    // Return red color for pressed state.
                    return Colors.grey;
                  }
                  // Return the default color for other states.
                  return Colors.red;
                },
              ),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/log-in-page");
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: white),
            )),
        const SizedBox(width: ten),
        TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ten),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    // Return red color for pressed state.
                    return Colors.grey;
                  }
                  // Return the default color for other states.
                  return Colors.green;
                },
              ),
            ),
            onPressed: () {
              checkError();
            },
            child: const Text(
              "Submit",
              style: TextStyle(color: white),
            )),
      ],
    );
  }

  void checkError() {
    if (_nameController.text.isEmpty ||
        _surnameController.text.isEmpty && (_thainameController.text.isEmpty || _thaisurnameController.text.isEmpty)) {
      setState(() {
        color = red;
      });
    } else {
      Navigator.popAndPushNamed(context, '/log-in-page');
    }
  }
}
