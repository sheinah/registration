import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:registration/app_values/double_size.dart';

import '../app_values/app_colors.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

final GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

class _CountryPickerState extends State<CountryPicker> {
  final TextEditingController _zipcode = TextEditingController();
  String get zipCode => _zipcode.text;

  String countryValue = "";
  String provinceValue = "";
  String districtValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: ten),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CSCPicker(
            key: _cscPickerKey,
            showStates: true,
            showCities: true,
            flagState: CountryFlag.ENABLE,
            dropdownDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(ten),
              border: Border.all(color: grey, width: 1),
            ),
            disabledDropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ten),
              color: Theme.of(context).colorScheme.background,
              border: Border.all(color: grey, width: 1),
            ),
            citySearchPlaceholder: "District",
            stateSearchPlaceholder: "Province",
            countrySearchPlaceholder: "Country",
            cityDropdownLabel: "District",
            stateDropdownLabel: "Province",
            countryDropdownLabel: "Country",
            selectedItemStyle: const TextStyle(
              color: Colors.black54,
              fontSize: fontFourteen,
            ),
            dropdownHeadingStyle: const TextStyle(
              color: black,
              fontSize: fontEighteen,
              fontWeight: FontWeight.bold,
            ),
            dropdownItemStyle: const TextStyle(
              color: black,
              fontSize: fontFourteen,
            ),
            dropdownDialogRadius: ten,
            searchBarRadius: ten,
            onCityChanged: (value) {
              setState(() {
                districtValue = value ?? "";
              });
            },
            onStateChanged: (value) {
              setState(() {
                provinceValue = value ?? "";
              });
            },
            onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
          ),
          const SizedBox(height: ten),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: ten),
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(ten),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _zipcode,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Zip code",
              ),
            ),
          )
        ],
      ),
    );
  }
}
