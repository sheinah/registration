import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:registration/app_values/app_colors.dart';
import 'package:registration/app_values/double_size.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/log-in-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: fifty, vertical: fifty),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Log in / เข้าสู่ระบบ',
                style: TextStyle(fontSize: fontTwenty, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: thirty),
              makeInput(
                "Email ",
                'example@gmail.com',
                "Please enter your email.",
                _emailController,
              ),
              const SizedBox(height: twenty),
              makeInput(
                "Password ",
                "********",
                "Please enter your password.",
                _passwordController,
              ),
              forgetPassword(),
              noAccount(),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput(
    String title,
    String hint,
    String validator,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: red),
              ),
            ],
          ),
        ),
        const SizedBox(height: ten),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: ten),
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            // initialValue: _emailController.text,
            validator: (value) {
              if (_emailController.text.isEmpty) {
                return validator;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget forgetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: twenty),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // where is it navigate to after click
          },
          child: const Text(
            "Forget password?",
            style: TextStyle(
              color: blue,
              decoration: TextDecoration.underline,
              decorationColor: blue,
            ),
          ),
        ),
      ),
    );
  }

  Widget noAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ten),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          children: [
            TextSpan(
                text: "Sign up",
                style: const TextStyle(
                  color: green,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.popAndPushNamed(context, "/register-page");
                  }),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: twenty),
      child: TextButton(
        style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(
            Size(twoHundred, thirty),
          ),
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
          // where is it navigate to after click Log in
        },
        child: const Text(
          "Log in",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
