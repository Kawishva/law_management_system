import 'package:flutter/material.dart';

class NameAndTextField extends StatefulWidget {
  final String name;
  final bool darkMode;
  final double width, height, fontsize;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;

  NameAndTextField(
      {super.key,
      required this.darkMode,
      required this.height,
      required this.name,
      required this.width,
      required this.padding,
      required this.fontsize,
      required this.controller});

  @override
  State<NameAndTextField> createState() => _NameAndTextFieldState();
}

class _NameAndTextFieldState extends State<NameAndTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        children: [
          Text(
            widget.name,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 2,
          ),
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: Center(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.darkMode == true
                            ? Colors.black.withOpacity(0.3)
                            : Color(0xFF7D7D7D).withOpacity(0.5),
                        width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.darkMode == true
                            ? Colors.black.withOpacity(0.6)
                            : Color(0xFF7D7D7D),
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  counterText: '',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: widget.fontsize,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
