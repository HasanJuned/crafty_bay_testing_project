import 'package:flutter/material.dart';
class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key, required this.onTap, required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.grey.shade300,
        child: Icon(icon, size: 18, color: Colors.black45,),
      ),
    );
  }
}
