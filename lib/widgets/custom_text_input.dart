import 'package:flutter/material.dart';

class customTextInput extends StatelessWidget {
  const customTextInput({
    super.key,
    required TextEditingController controller, required this.icon, required this.isObscure, this.keyboard, required this.hint,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Icon icon;
  final bool isObscure;
  final TextInputType? keyboard;
  final  String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
       height: 60,
       width: double.maxFinite,
        child: TextField(
          controller: _controller, 
          keyboardType: keyboard,
          obscureText: isObscure,
          decoration: InputDecoration(
            icon: icon,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))),),
      ),
    );
  }
}
