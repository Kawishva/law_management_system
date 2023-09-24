import 'package:flutter/material.dart';
import 'package:law_management_system/components/form_components/name&textfield.dart';

class FormFile extends StatefulWidget {
  final bool darkMode;
  final double width, height;
  final TextEditingController caseNo, police, location;

  FormFile(
      {super.key,
      required this.darkMode,
      required this.height,
      required this.width,
      required this.caseNo,
      required this.location,
      required this.police});

  @override
  State<FormFile> createState() => _FormFileState();
}

class _FormFileState extends State<FormFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width / 2,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.darkMode == true ? Color(0xFFC9C9C9) : Colors.white,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Form',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          NameAndTextField(
              controller: widget.caseNo,
              darkMode: widget.darkMode,
              height: widget.height / 30,
              width: widget.width / 20,
              fontsize: widget.height / 65,
              name: 'CaseNo :',
              padding: EdgeInsets.only(left: 5)),
          SizedBox(
            height: 15,
          ),
          NameAndTextField(
              controller: widget.police,
              darkMode: widget.darkMode,
              height: widget.height / 30,
              width: widget.width / 5,
              fontsize: widget.height / 65,
              name: 'Police :',
              padding: EdgeInsets.only(left: 5)),
          SizedBox(
            height: 5,
          ),
          NameAndTextField(
              controller: widget.location,
              darkMode: widget.darkMode,
              height: widget.height / 30,
              width: widget.width / 3,
              fontsize: widget.height / 65,
              name: 'Location :',
              padding: EdgeInsets.only(left: 5)),
        ],
      ),
    );
  }
}
