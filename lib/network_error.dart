import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:webview/home_page.dart';

class NetworkError extends StatefulWidget {
  static const String id = 'network_error_screen';
  @override
  _NetworkErrorState createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  bool isConnected = false;

  checkConnection() async {
    isConnected = await DataConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff377eaa),
        alignment: Alignment.center,
        child: Container(
          child: InkWell(
            child: Image.asset('assets/network-error.png'),
            onTap: () {
              setState(() {
                checkConnection();
              });
              if (isConnected) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
