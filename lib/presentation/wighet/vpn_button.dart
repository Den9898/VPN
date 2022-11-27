import 'package:flutter/material.dart';

class VpnButton extends StatelessWidget {
  final Function() onTap;
  final Widget title;

  const VpnButton({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  VpnButton.text({
    required this.onTap,
    required String title,
    Key? key,
  })  : title = Text(
    title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        alignment: Alignment.center,
        child: title,
      ),
    );
  }
}
