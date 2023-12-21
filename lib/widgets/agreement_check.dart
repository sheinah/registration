import 'package:flutter/material.dart';
import 'package:registration/app_values/app_colors.dart';

class AgreementCheckBox extends StatefulWidget {
  const AgreementCheckBox({super.key});

  @override
  State<AgreementCheckBox> createState() => _AgreementCheckBoxState();
}

class _AgreementCheckBoxState extends State<AgreementCheckBox> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Checkbox(
            value: _isCheck,
            onChanged: ((value) {
              setState(() {
                _isCheck = value!;
              });
            }),
          ),
          RichText(
            text: const TextSpan(
              text: 'I have read and agree to the ',
              children: [
                TextSpan(
                  text: "terms of service",
                  style: TextStyle(color: blue, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
