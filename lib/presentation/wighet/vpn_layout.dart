import 'package:flutter/material.dart';

class VpnLayout extends StatelessWidget {
  final Widget body;
  final EdgeInsets padding;

  const VpnLayout({
    required this.body,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}