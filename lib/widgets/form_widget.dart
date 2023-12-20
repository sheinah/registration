import 'package:flutter/material.dart';
import 'package:registration/app_values/double_size.dart';

import '../app_values/app_colors.dart';

Widget nameForm(
  BuildContext context,
  String title,
  String hint,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: ten),
    child: Column(
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
          width: MediaQuery.of(context).size.width / 2.3,
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
          ),
        ),
      ],
    ),
  );
}

Widget addressForm(
  BuildContext context,
  String title,
  TextEditingController controller,
  TextEditingController controller1,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: ten),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
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
        addressDetails(
          context,
          'House Number',
          'Village Number',
          controller,
          controller1,
        ),
        const SizedBox(height: ten),
        addressDetails(
          context,
          'Village Name',
          'Sub street name',
          controller,
          controller1,
        ),
        const SizedBox(height: ten),
        addressDetails(
          context,
          'Street Name',
          'Sub district name',
          controller,
          controller1,
        ),
      ],
    ),
  );
}

Widget addressDetails(
  BuildContext context,
  String hint,
  String hint1,
  TextEditingController controller,
  TextEditingController controller1,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: ten),
        width: MediaQuery.of(context).size.width / 2.3,
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
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: ten),
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          border: Border.all(color: grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller1,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint1,
          ),
        ),
      ),
    ],
  );
}
