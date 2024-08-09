import 'package:flutter/material.dart';

class OtpSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF00AD83), width: 4),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Color(0xFF00AD83),
                    size: 50,
                  ),
                ),
              ),
            ),


            Spacer(),


            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),


            Text(
              'Congratulations! You have been                                                                successfully authenticated.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),


            Spacer(),

            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Continue', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00AD83),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
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