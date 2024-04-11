import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xfffda758),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF573353),
          ),
        ),
      ),
    );
  }
}
