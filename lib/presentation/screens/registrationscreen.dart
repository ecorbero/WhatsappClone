import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/pages/sub/phone_verification_page.dart';
import 'package:whatsapp_clone/presentation/widgets/theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("91");

  String _countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                      fontSize: 18,
                      color: greenColor,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Whatsapp Clone will send an SMS message (carrier charges may apply) to verify your phone number. Please Enter your country code and phone number",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: _openCountryPickerDialog,
              title: _buildDialogItem(_selectedFilteredDialogCountry),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.5, color: greenColor))),
                  width: 80,
                  alignment: Alignment.center,
                  height: 42,
                  child: Text("${_selectedFilteredDialogCountry.phoneCode}"),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Phone number",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PhoneVerificationPage()));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
            data: Theme.of(context).copyWith(primaryColor: primaryColor),
            child: CountryPickerDialog(
              isSearchable: true,
              titlePadding: EdgeInsets.all(8),
              searchCursorColor: Colors.black,
              searchInputDecoration: InputDecoration(hintText: "Search"),
              title: Text("Select your phone code"),
              onValuePicked: (Country country) {
                setState(() {
                  _selectedFilteredDialogCountry = country;
                  _countryCode = country.phoneCode;
                });
              },
              itemBuilder: _buildDialogItem,
            )));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: greenColor, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            height: 8,
          ),
          Text("+${country.phoneCode}"),
          SizedBox(
            height: 8,
          ),
          Text("${country.name}"),
          Spacer(),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
