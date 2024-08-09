import 'package:flutter/material.dart';
import 'package:otplogin_page/otpsuccess_page.dart';

class OtpVerificationPage extends StatefulWidget {
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  List<String> _otp = ["", "", "", ""];
  final _controllers = List.generate(4, (_) => TextEditingController());

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm() {
    if (_otp.every((digit) => digit.isNotEmpty)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpSuccessPage()),
      );
    } else {
      _showAlertDialog('Error', 'Please enter all OTP digits');
    }
  }

  void _resendOtp() {
    _showAlertDialog('OTP Sent', 'A new OTP has been sent to your phone number.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
              child: Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'We have sent an OTP                                                                      to your phone number',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),

            Spacer(),

            // OTP Fields
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 60,
                      width: 60,
                      child: TextField(
                        controller: _controllers[index],
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                          _otp[index] = value;
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF00AD83)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF00AD83)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Spacer(),

            // Confirm Button
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onConfirm,
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00AD83),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: GestureDetector(
                  onTap: _resendOtp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Haven\'t received the OTP? ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Resend',
                        style: TextStyle(
                          color: Color(0xFF00AD83),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}