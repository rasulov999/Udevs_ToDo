import 'package:flutter/material.dart';

class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(""),
        SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(border: const OutlineInputBorder()),
        ),
      ],
    );
  }
}
