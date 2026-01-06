import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withLeading;

  const CustomAppBar({
    super.key,
    this.withLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff24263B),
      title: const Text(
        'BMI Calculator',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      leading: withLeading
          ? Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(30),
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
