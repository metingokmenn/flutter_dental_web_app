import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.isHover,
    required this.text,
    required this.routeName,
    required this.onHover,
    this.onTap, // Add onTap callback
  });

  final bool isHover;
  final String text;
  final String routeName;
  final ValueChanged<bool?> onHover;
  final VoidCallback? onTap; // Add onTap callback

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Use onTap callback
      onHover: onHover,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          text,
          style: TextStyle(
            color: isHover ? Colors.blue : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
