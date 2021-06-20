import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkapp/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:linkapp/presentation/pages/set_initial_profile_page.dart';
import 'package:linkapp/presentation/widgets/theme/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {


  TextEditingController _pinCodeController=TextEditingController();

  String get requiredNumber => widget.phoneNumber;

  // Object get requiredNumber => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(""),
                Text(
                  "LinkApp Chat",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.w500),
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "LinkApp Chat will send an SMS message  to verify your phone number.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _pinCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.lightGreen,
                  minWidth: 150,
                  height: 40,
                  onPressed: _submitSmsCode,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  Widget _pinCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: <Widget>[
          PinCodeTextField(
            controller: _pinCodeController,
            length: 6,
            backgroundColor: Colors.transparent,
            obscureText: true,
            autoDisposeControllers: false,
            onChanged: (pinCode){
              print(pinCode);
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              inactiveColor: Colors.black54,
              activeColor: Colors.lightGreen,
              selectedColor: Colors.lightGreen,
            ),
            onCompleted: (pinCode){
              if (pinCode == requiredNumber){
                print('Code Valid');
              }else{
                print ('Invalid Code');
              }
          },
          ),
          Text("Enter your 6 digit code")
        ],
      ),
    );
  }

  void _submitSmsCode(){
    if (_pinCodeController.text.isNotEmpty){
      BlocProvider.of<PhoneAuthCubit>(context)
          .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }
}
