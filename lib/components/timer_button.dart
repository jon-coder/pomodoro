import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? action;

  const TimerButton({
    Key? key,
    required this.title,
    required this.icon,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        textStyle: GoogleFonts.oxygen(fontSize: 24),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
          ),
          Text(title),
        ],
      ),
    );
  }
}
