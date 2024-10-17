import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required TextEditingController controller,
    required this.icon,
    required this.isObscure,
    this.keyboard,
    required this.hint,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Icon icon;
  final bool isObscure;
  final TextInputType? keyboard;
  final String hint;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late bool obscured;
  @override
  void initState() {
    obscured = widget.isObscure ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        width: double.maxFinite,
        child: TextField(
          controller: widget._controller,
          keyboardType: widget.keyboard,
          obscureText: obscured,
          decoration: InputDecoration(
              suffixIcon: widget.isObscure
                  ? IconButton(
                      tooltip: obscured ? 'Show Password' : 'Hide Password',
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(
                          () => obscured = !obscured,
                        );
                      },
                      icon: Icon(
                        obscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color.fromRGBO(156, 163, 200, 1),
                      ),
                    )
                  : null,
              icon: widget.icon,
              hintText: widget.hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}