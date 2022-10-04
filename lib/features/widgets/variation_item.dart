import 'package:flutter/material.dart';

class TextFormViration extends StatelessWidget {
  TextFormViration(
      {Key? key,
      required this.lable,
      this.value,
      required this.isReadOnly,
      this.onChanged})
      : super(key: key);
  TextEditingController controller = TextEditingController();
  String lable;
  bool isReadOnly;
  String? value;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: TextFormField(
        initialValue: value,
        // controller: controller,
        readOnly: isReadOnly,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: lable,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
