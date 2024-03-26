import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  const InputCustom({
    super.key,
    required this.label,
    this.image,
    this.icon,
    this.bottomPadding = true,
    this.controller,
    this.isPassword = false,
    this.enable = true,
    this.maxLines,
    this.textInputType,
    this.hintText,
    this.validator,
  });
  final String label;
  final String? image;
  final IconData? icon;
  final bool bottomPadding;
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? enable;
  final int? maxLines;
  final TextInputType? textInputType;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ? 10 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 50,
              maxHeight: 270,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: widget.image != null
                    ? Image.asset(widget.image!)
                    : widget.icon != null
                        ? Icon(widget.icon)
                        : null,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                suffixIcon: widget.isPassword!
                    ? obscureText
                        ? GestureDetector(
                            onTap: () => setState(() {
                                  obscureText = !obscureText;
                                }),
                            child: const Icon(
                              Icons.visibility,
                              color: Color(0xFFf40d53),
                            ))
                        : GestureDetector(
                            onTap: () => setState(() {
                              obscureText = !obscureText;
                            }),
                            child: const Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xFFf40d53),
                            ),
                          )
                    : null,
                hintText: widget.hintText,
              ),
              cursorColor: const Color(0xFFf40d53),
              controller: widget.controller,
              obscureText: widget.isPassword! ? obscureText : false,
              enabled: widget.enable,
              minLines: widget.maxLines != null ? 1 : null,
              maxLines: widget.maxLines ?? 1,
              keyboardType: widget.textInputType,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
