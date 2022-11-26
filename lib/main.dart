import 'package:flutter/material.dart';

import 'package:untitled4/splashScreen.dart';

void main() => runApp(MaterialApp(
      home: splashScreen(),
    ));

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.vpn_key_outlined,),
              ),
              Text(
                '12,34',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
