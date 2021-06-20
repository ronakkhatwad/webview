import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:webview/home_page.dart';
import 'package:webview/network_error.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Matrix',
      home: NewSplashScreen(),
    );
  }
}

class NewSplashScreen extends StatefulWidget {
  @override
  _NewSplashScreenState createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen> {
  bool _isConnected = false;
  Timer _timer;
  checkConnection() async {
    await DataConnectionChecker().hasConnection.then((value) {
      setState(() {
        _isConnected = value;
      });
      _timer = new Timer(const Duration(seconds: 3), () {
        if (_isConnected) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NetworkError(),
            ),
          );
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff377eaa),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            Center(
              child: Container(
                height: 130,
                width: 130,
                child: Image.asset(
                  'assets/logo-white.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Loading your account...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
    // SplashScreen(
    //   seconds: 7,
    //   navigateAfterSeconds:
    //       (_isConnected == true) ? HomePage() : NetworkError(),
    //   backgroundColor: Color(0xff377eaa),
    //   photoSize: 60,
    //   image: Image.asset(
    //     'assets/logo-white.png',
    //   ),
    //   useLoader: false,
    // );
  }
}
